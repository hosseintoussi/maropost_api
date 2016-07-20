module MaropostApi
  class Response
    def initialize(response: {}, parser:)
      @response = response
      @parser = parser
    end

    def call
      case @response.code
      when 400
        raise BadRequest.new
      when 401...402
        raise Unauthorized.new
      when 404
        raise  NotFound.new
      when 422
        raise UnprocessableEntity.new
      when 500
        raise InternalServerError.new
      else
        @parser.call(@response)
      end
    end
  end
end
