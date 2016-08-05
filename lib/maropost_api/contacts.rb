module MaropostApi
  class Contacts
    def initialize(request:, parser: Parser::EntityParser.new)
      @request = request
      @parser = parser
    end

    def find_by_email(email:)
      response = @request.get(endpoint: "/contacts/email.json?contact[email]=#{CGI.escape(email)}")
      Response.new(response: response, parser: @parser).call
    end

    def add_to_list(list_ids:, params:)
      response = @request.post(endpoint: "/contacts.json?list_ids=#{list_ids}", params: params)
      Response.new(response: response, parser: @parser).call
    end

    def create(params:)
      response = @request.post(endpoint: "/contacts.json", params: params)
      Response.new(response: response, parser: @parser).call
    end

    def update(contact_id:, params:)
      response = @request.put(endpoint: "/contacts/#{contact_id}.json", params: params)
      Response.new(response: response, parser: @parser).call
    end

    def unsubscribe_all_lists(email:)
      response = @request.put(endpoint: "/contacts/unsubscribe_all.json?contact[email]=#{CGI.escape(email)}")
      Response.new(response: response, parser: @parser).call
    end

    alias :upsert :create
  end
end
