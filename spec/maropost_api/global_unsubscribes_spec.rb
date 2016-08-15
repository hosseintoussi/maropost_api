require "spec_helper"

describe MaropostApi::GlobalUnsubscribes do
  before do
    @client = MaropostApi::Client.new(auth_token: TOKEN, account_number: ACCOUNT_ID)
  end

  describe "#find_by_email", vcr: true do
    context "when contact exists in DNM list" do
      it "returns contact's email" do
        response = @client.global_unsubscribes.find_by_email(email: "example@gmail.com")

        expect(response.email).to eq("example@gmail.com")
      end

    context "when contact does not exist in DNM list" do
      it "returns a message" do
        response = @client.global_unsubscribes.find_by_email(email: "example3@gmail.com")

        expect(response.message).to eq("Contact not present.")
      end
    end
    end
  end

  describe "#add_to_dnm", vcr: true do
    context "when adding a contact in dnm list" do
      it "returns the contact's email" do
        response = @client.global_unsubscribes.add_to_dnm(email: "example5@gmail.com")

        expect(response.email).to eq("example5@gmail.com")
      end
    end
  end
end
