module Transifex
  class Stats
    attr_accessor :client, :completed, :translated_entities, :untranslated_entities, :translated_words, :untranslated_words, :last_update, :last_committer, :reviewed, :reviewed_percentage

    def initialize(transifex_data)
      @completed = transifex_data[:completed]
      @translated_entities = transifex_data[:translated_entities]
      @untranslated_entities = transifex_data[:untranslated_entities]
      @translated_words = transifex_data[:translated_words]
      @untranslated_words = transifex_data[:untranslated_words]
      @last_update = transifex_data[:last_update]
      @last_committer = transifex_data[:last_committer]
      @reviewed = transifex_data[:reviewed]
      @reviewed_percentage = transifex_data[:reviewed_percentage]
    end

  end
end
