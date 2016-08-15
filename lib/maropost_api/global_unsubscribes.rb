module MaropostApi
  class GlobalUnsubscribes
    def initialize(request:, parser: Parser::EntityParser.new)
      @request = request
      @parser = parser
    end

    def find_by_email(email:)
      response = @request.get(endpoint: "/global_unsubscribes/email.json?contact[email]=#{CGI.escape(email)}")
      Response.new(response: response, parser: @parser).call
    end

    def add_to_dnm(email:)
      params = { "global_unsubscribe": { "email": email } }
      response = @request.post(endpoint: "/global_unsubscribes.json", params: params)
      Response.new(response: response, parser: @parser).call
    end
  end
end
