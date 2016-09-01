module MaropostApi
  class Journeys
    def initialize(request:, parser: Parser::EntityParser.new)
      @request = request
      @parser = parser
    end

    def stop(journey_id:, contact_id:)
      response = @request.put(endpoint: "/journeys/#{journey_id}/stop/#{contact_id}.json")
      Response.new(response: response, parser: @parser).call
    end

    def start(journey_id:, contact_id:)
      response = @request.put(endpoint: "/journeys/#{journey_id}/start/#{contact_id}.json")
      Response.new(response: response, parser: @parser).call
    end

    def reset(journey_id:, contact_id:)
      response = @request.put(endpoint: "/journeys/#{journey_id}/reset/#{contact_id}.json")
      Response.new(response: response, parser: @parser).call
    end

    def stop_all_journeys(email:)
      response = @request.put(endpoint: "/journeys/stop_all_journeys.json?email=#{CGI.escape(email)}")
      Response.new(response: response, parser: @parser).call
    end
  end
end
