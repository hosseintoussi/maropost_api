module MaropostApi
  class Contacts
    def initialize(request:)
      @request = request
    end

    def find_by_email(email:)
      response = @request.get(endpoint: "contacts/email.json?contact[email]=#{email}")
      Response.new(response: response).call
    end

    def add_to_list(list_ids: "", params:)
      response = @request.post(endpoint: "contacts.json?list_ids=#{list_ids}", params: params)
      Response.new(response: response).call
    end
    alias_method :update, :add_to_list
  end
end
