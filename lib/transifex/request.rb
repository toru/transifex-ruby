require 'faraday'
require 'faraday_middleware'

module Transifex
  module Request
    def set_credentials(username, password)
      @username = username
      @password = password
    end

    def connection
      @connection ||= make_connection(@username, @password)
    end

    def get(path, params = {})
      response = connection.get(build_path(:v2, path), params)
      response.body
    end

    private

    def build_path(version, path)
      "/api/2#{path}"
    end

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
        builder.use Transifex::Response::RaiseHttpException

        # Authentiation
        builder.basic_auth(username, password)

        # Request Middleware
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded

        builder.adapter :net_http
      end
    end
  end
end
