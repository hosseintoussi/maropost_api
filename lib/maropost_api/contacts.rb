module MaropostApi
  class Contacts
    def initialize(request:)
      @request = request
    end

    def find_by_email(email:)
      @request.get(endpoint: "contacts/email.json?contact[email]=#{email}")
    end

    def add_to_list(list_ids:, params:)
      @list_ids = list_ids
      @request.post(endpoint: "contacts.json?list_ids=#{@list_ids}", params: params)
    end
  end
end
