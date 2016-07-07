require 'maropost_api/request'
require 'maropost_api/client/contacts'

module MaropostApi
  class Client
    include Contacts

    def initialize(auth_token:, account_number:)
      @request = MaropostApi::Request.new(auth_token: auth_token, account_number: account_number)
      @account_number = account_number
    end
  end
end
