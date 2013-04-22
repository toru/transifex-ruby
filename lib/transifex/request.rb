require 'faraday'
require 'faraday_middleware'

module Transifex
  module Request
    def connection(username, password)
      @connection ||= make_connection(username, password)
    end

    def get(path, params = {})
      connection.get(path, params)
    end

    private

    def make_connection(username, password)
      options = {
        headers: {
          'Accept' => 'application/json',
          'User-Agent' => Transifex::Config::USER_AGENT,
        },
        url: Transifex::Config::BASE_URL
      }

      Faraday.new(options) do |builder|
        builder.use FaradayMiddleware::Mashify
        builder.use Faraday::Response::ParseJson, :content_type => /\bjson$/
        builder.use Faraday::Response::RaiseError

        # Authentiation
        builder.basic_auth(username, password)

        # Request Middleware
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded

        builder.adapter :net_http
      end
    end

    extend self
  end
end
