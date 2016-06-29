# coding: utf-8
require 'spec_helper'

describe MaropostApi::Client::Contacts do
  before do
    @client = MaropostApi::Client.new(auth_token: AUTH_TOKEN, account_number: ACCOUNT_NUMBER)
  end

  describe '#contact_upsert', vcr: true do
    context 'with correct params' do
      it 'sends upsert request with provided contact params' do
        list_ids = '43405'
        params = { email: 'haidar.mvstg+test_maropost_api_client@gmail.com',
                   first_name: 'haidar maropost api test' }

        response = @client.contact_upsert(list_ids: list_ids, params: params)
        expect(response['email']).to eq(params[:email])
      end
    end
  end
end
