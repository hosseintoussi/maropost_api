require 'spec_helper'

describe MaropostApi::Client::Contacts do
  before do
    @client = MaropostApi::Client.new(auth_token: TOKEN, account_number: ACCOUNT_ID)
  end

  describe '#contact_upsert', vcr: true do
    context 'with correct params' do
      it 'sends upsert request with provided contact params' do
        list_ids = '43405'
        params = { email: 'dev@mindvalley.com',
                   first_name: 'dev' }

        response = @client.add_contact_to_list(list_ids: list_ids, params: params)
        expect(response['email']).to eq(params[:email])
      end
    end
  end

  describe ".find_by_email", vcr: true do
    context 'when searching for a contact by email' do
      it 'returns the contact if it exists' do
        email = "dev@mindvalley.com"
        response = @client.find_contact_by_email(email: email)
        expect(response['email']).to eq(email)
      end
    end
  end
end
