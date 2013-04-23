module Transifex
  class Error < StandardError
    attr_accessor :response
    def initialize(response = nil)
      @response = response
      super
    end
  end

  class Unauthorized < Error; end
  class Forbidden < Error; end
  class NotFound < Error; end
  class NotAcceptable < Error; end
  class Conflict < Error; end
  class UnsupportedMediaType < Error; end
  class UnprocessableEntity < Error; end
end
