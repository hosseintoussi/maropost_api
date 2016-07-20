module MaropostApi
  module Parser
    class MessageBodyParser
      def call(response)
        Hashie::Mash.new(message: response.body)
      end
    end
  end
end
