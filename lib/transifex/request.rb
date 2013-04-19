require 'faraday'
require 'faraday_middleware'

module Transifex
  module Request
    def connection
      @connection ||= make_connection
    end

    private

    def make_connection
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

        # Request Middleware
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded

        builder.adapter :net_http
      end
    end

    extend self
  end
end
