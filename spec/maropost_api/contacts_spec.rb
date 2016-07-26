require "spec_helper"

describe MaropostApi::Contacts do
  before do
    @client = MaropostApi::Client.new(auth_token: TOKEN, account_number: ACCOUNT_ID)
  end

  describe "#add_to_list", vcr: true do
    context "when correct params are passed" do
      it "sends upsert request with provided contact params" do
        list_ids = "43405"
        params = { email: "example@gmail.com",
                   first_name: "dev" }

        response = @client.contacts.add_to_list(list_ids: list_ids, params: params)

        expect(response.email).to eq(params[:email])
      end
    end
  end

  describe "#find_by_email", vcr: true do
    context "when searching for a contact by email" do
      it "returns the contact if it exists" do
        email = "example@gmail.com"

        response = @client.contacts.find_by_email(email: email)

        expect(response.email).to eq(email)
      end
    end
  end

  describe "#create", vcr: true do
    context "when correct params are passed" do
      it "sends a post requests with provided params" do
        params = { email: "example@gmail.com",
                   first_name: "dev" }

        response = @client.contacts.create(params: params)

        expect(response.email).to eq(params[:email])
      end
    end
  end

  describe "#upsert", vcr: true do
    context "when correct params are passed" do
      it "sends a post requests with provided params" do
        params = { email: "example@gmail.com",
                   first_name: "dev_change" }

        response = @client.contacts.upsert(params: params)

        expect(response.email).to eq(params[:email])
        expect(response.first_name).to eq(params[:first_name])
      end
    end
  end

  describe "#update", vcr: true do
    context "when correct are passed to update a contact." do
      it "sends a put request with provided params" do
        params = { email: "example@gmail.com",
                   first_name: "dev" }
        contact = @client.contacts.create(params: params)

        response = @client.contacts.update(contact_id: contact.id, params: {first_name: "test"} )

        expect(response.first_name).to eq("test")
      end
    end
  end
end
