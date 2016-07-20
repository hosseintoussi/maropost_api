require "spec_helper"

describe MaropostApi::Workflows do
  before do
    @client = MaropostApi::Client.new(auth_token: TOKEN, account_number: ACCOUNT_ID)
  end

  describe "#start", vcr: true do
    context "with correct params" do
      it "sends start request with provided params" do
        workflow_id = "9359"
        contact_id = "742520380"

        response = @client.workflows.start(workflow_id: workflow_id, contact_id: contact_id)
        expect(response.message).to include('Success')
      end
    end
  end

  describe "#stop", vcr: true do
    context "with correct params" do
      it "sends stop request with provided params" do
        workflow_id = "9359"
        contact_id = "742520380"

        response = @client.workflows.stop(workflow_id: workflow_id, contact_id: contact_id)
        expect(response.message).to be_nil
      end
    end
  end

  describe "#reset", vcr: true do
    context "with correct params" do
      it "sends reset request with provided params" do
        workflow_id = "9359"
        contact_id = "742520380"

        response = @client.workflows.reset(workflow_id: workflow_id, contact_id: contact_id)
        expect(response.message).to include('successfully')
      end
    end
  end
end
