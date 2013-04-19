require 'transifex/version'

module Transifex
  module Config
    BASE_URL = ENV['TRANSIFEX_BASE_URL'] || 'https://www.transifex.com/api/2/'
    USER_AGENT = "transifex-ruby #{Transifex::VERSION}"
    VALID_OPTIONS = [:username, :password]

    attr_accessor *VALID_OPTIONS

    def configure
      yield self
    end
  end
end
