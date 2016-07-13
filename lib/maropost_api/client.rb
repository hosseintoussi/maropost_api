module MaropostApi
  class Client

    def initialize(auth_token:, account_number:)
      @request = MaropostApi::Request.new(auth_token: auth_token, account_number: account_number)
    end

    def contacts
      @contacts ||= Contacts.new(request: @request)
    end
  end
end
