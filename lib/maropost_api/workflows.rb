module MaropostApi
  class Workflows
    def initialize(request:)
      @request = request
      @body_parser = Parser::MessageBodyParser.new
      @entity_parser = Parser::EntityParser.new
    end

    def stop(workflow_id:, contact_id:)
      response = @request.put(endpoint: "/workflows/#{workflow_id}/stop/#{contact_id}.json")
      Response.new(response: response, parser: @body_parser).call
    end

    def start(workflow_id:, contact_id:)
      response = @request.put(endpoint: "/workflows/#{workflow_id}/start/#{contact_id}.json")
      Response.new(response: response, parser: @body_parser).call
    end

    def reset(workflow_id:, contact_id:)
      response = @request.put(endpoint: "/workflows/#{workflow_id}/reset/#{contact_id}.json")
      Response.new(response: response, parser: @entity_parser).call
    end
  end
end
