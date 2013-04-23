require 'uri'
require 'pry'
require 'rspec'
require 'transifex'
require 'webmock/rspec'

def make_endpoint(path)
  URI.join(Transifex::Config::BASE_URL, "/api/2/#{path}").to_s
end

def stub_get(path)
  stub_request(:get, make_endpoint(path))
end
