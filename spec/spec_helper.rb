require 'uri'
require 'pry'
require 'rspec'
require 'transifex'
require 'webmock/rspec'

BASE_HEADERS = { :content_type => 'application/json; charset=utf-8' }

def make_endpoint(path)
  URI.join(Transifex::Config::BASE_URL, "/api/2/#{path}").to_s
end

def stub_get(path)
  stub_request(:get, make_endpoint(path))
end

def fixture(file)
  prefix = File.expand_path('../fixtures', __FILE__)
  File.new(File.join(prefix, file))
end
