module MaropostApi
  class Workflows
    def initialize(request:, parser: Parser::EntityParser.new)
      @request = request
      @parser = parser
    end

    def stop(workflow_id:, contact_id:)
      response = @request.put(endpoint: "/workflows/#{workflow_id}/stop/#{contact_id}.json")
      Response.new(response: response, parser: @parser).call
    end

    def start(workflow_id:, contact_id:)
      response = @request.put(endpoint: "/workflows/#{workflow_id}/start/#{contact_id}.json")
      Response.new(response: response, parser: @parser).call
    end

    def reset(workflow_id:, contact_id:)
      response = @request.put(endpoint: "/workflows/#{workflow_id}/reset/#{contact_id}.json")
      Response.new(response: response, parser: @parser).call
    end
  end
end
