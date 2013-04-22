require 'transifex/request'

module Transifex
  class Client
    def initialize(options = {})
      @username = options[:username] || Transifex.username
      @password = options[:password] || Transifex.password
      @connection = Request.connection(@username, @password)
    end

    def projects
      @connection.get('/api/2/projects/')
    end
  end
end
