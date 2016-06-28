require 'httparty'
require 'maropost_api/client/contacts'

module MaropostApi
  class Client
    include HTTParty
    include Contacts

    def initialize(auth_token:, account_number:)
      @auth_token = auth_token
      @account_number = account_number
      set_default_config
    end

    private

    def set_default_config
      @base_uri = "http://api.maropost.com/accounts/#{@account_number}"
      @default_params = { auth_token: @auth_token }
    end
  end
end
