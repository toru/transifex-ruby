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
      get('/projects/').map do |project|
        Transifex::Project.new(project).tap {|p| p.client = self }
      end
    end

    def project(slug)
      Transifex::Project.new(get("/project/#{slug}/")).tap do |project|
        project.client = self
      end
    end
  end
end
