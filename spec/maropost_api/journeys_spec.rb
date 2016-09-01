require "spec_helper"

describe MaropostApi::Journeys do
  before do
    @client = MaropostApi::Client.new(auth_token: TOKEN, account_number: ACCOUNT_ID)
  end

  describe "#start", vcr: true do
    context "with correct params" do
      it "sends start request with provided params" do
        journey_id = "12429"
        contact_id = "742520380"

        response = @client.journeys.start(journey_id: journey_id, contact_id: contact_id)
        expect(response.message).to include("Success")
      end
    end
  end

  describe "#stop", vcr: true do
    context "with correct params" do
      it "sends stop request with provided params" do
        journey_id = "12429"
        contact_id = "742520380"

        response = @client.journeys.stop(journey_id: journey_id, contact_id: contact_id)
        expect(response.message).to include("Success")
      end
    end
  end

  describe "#reset", vcr: true do
    context "with correct params" do
      it "sends reset request with provided params" do
        journey_id = "12429"
        contact_id = "742520380"

        response = @client.journeys.reset(journey_id: journey_id, contact_id: contact_id)
        expect(response.message).to include("successfully")
      end
    end
  end

  describe "#stop_all_journeys", vcr: true do
    context "with correct params" do
      it "stops all the journeys for the provided email" do
        response = @client.journeys.stop_all_journeys(email: "example@gmail.com")
        expect(response.message).to include("Success")
      end
    end
  end
end
