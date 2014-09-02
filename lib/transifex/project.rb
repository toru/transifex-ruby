module Transifex
  class Project
    attr_accessor :client, :name, :description, :source_language_code, :slug

    def initialize(transifex_data)
      @name = transifex_data[:name]
      @description = transifex_data[:description]
      @source_language_code = transifex_data[:source_langauge_code]
      @slug = transifex_data[:slug]
    end

    def resources
      client.get("/project/#{@slug}/resources/").map do |resource|
        Transifex::Resource.new(@slug, resource).tap {|r| r.client = client }
      end
    end

    def resource(resource_slug)
      resource = client.get("/project/#{@slug}/resource/#{resource_slug}")
      Transifex::Resource.new(@slug, resource).tap {|r| r.client = client }
    end

    def languages
      client.get("/project/#{@slug}/languages/").map do |language|
        Transifex::Language.new(@slug, language).tap {|r| r.client = client }
      end
    end

  end
end
