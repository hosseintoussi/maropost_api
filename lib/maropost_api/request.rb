require 'httparty'

module MaropostApi
  class Request
    include HTTParty

    def initialize(auth_token:, account_number:)
      @auth_token = auth_token
      @account_number = account_number
      set_default_config
    end

    def post(endpoint:, params: {})
      self.class.post(uri(endpoint), payload(params))
    end

    def get(endpoint:, params: {})
      self.class.get(uri(endpoint), payload(params))
    end

    def put(endpoint:, params: {})
      self.class.put(uri(endpoint), payload(params))
    end

    private

    def set_default_config
      @base_uri = "http://api.maropost.com/accounts/#{@account_number}"
      @default_params = { auth_token: @auth_token }
    end

    def uri(endpoint)
      "#{@base_uri}/#{endpoint}"
    end

    def payload(params)
      { body: merge_auth_token(params).to_json,
        headers: { 'Content-Type' => 'application/json' } }
    end

    def merge_auth_token(params)
      @default_params.merge(params)
    end
  end
end
