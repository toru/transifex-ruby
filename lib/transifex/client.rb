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
      get build_path(:v2, '/projects/')
    end

    def project(slug)
      get build_path(:v2, "/project/#{slug}/")
    end
  end
end
