module MaropostApi
  module Parser
    class EntityParser
      def call(response)
        Hashie::Mash.new(response)
      end
    end
  end
end
