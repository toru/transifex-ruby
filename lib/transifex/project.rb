module Transifex
  class Project
    include Transifex::Request

    attr_accessor :client, :name, :description, :source_language_code, :slug

    def initialize(transifex_data)
      @name = transifex_data[:name]
      @description = transifex_data[:description]
      @source_language_code = transifex_data[:source_langauge_code]
      @slug = transifex_data[:slug]
    end

    def resources
      client.get("/project/#{@slug}/resources/")
    end

    def resource(resource_slug)
      client.get("/project/#{@slug}/resources/#{resource_slug}")
    end
  end
end
