require 'transifex/request'

module Transifex
  class Client
    include Transifex::Request

    def initialize(options = {})
      set_credentials(
        options[:username] || Transifex.username,
        options[:password] || Transifex.password
      )
    end

    def projects
      get('/api/2/projects/')
    end
  end
end
