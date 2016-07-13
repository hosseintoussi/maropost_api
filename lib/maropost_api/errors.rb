module MaropostApi
  class Errors < StandardError; end
  class InternalServerError < Errors; end
  class BadRequest < Errors; end
  class Unauthorized < Errors; end
  class NotFound < Errors; end
  class UnprocessableEntity < Errors; end
end
