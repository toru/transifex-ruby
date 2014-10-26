module Transifex
  class Language
    attr_accessor :client, :language_code, :coordinators, :translators, :reviewers

    def initialize(project_slug, transifex_data)
      @project_slug = project_slug
      @language_code = transifex_data[:language_code]
      @coordinators = transifex_data[:coordinators]
      @translators = transifex_data[:translators]
      @reviewers = transifex_data[:reviewers]
    end

  end
end
