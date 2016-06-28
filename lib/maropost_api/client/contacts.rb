module MaropostApi
  class Client
    module Contacts
      def contact_upsert(list_ids:, params:)
        @list_ids = list_ids
        payload = generate_payload(params)
        self.class.post("#{@base_uri}/contacts.json?list_ids=#{@list_ids}", payload)
      end

      private

      def generate_payload(params)
        { body: generate_params(params).to_json,
          headers: { 'Content-Type' => 'application/json' } }
      end

      def generate_params(params)
        @default_params.merge(contact: params)
      end
    end
  end
end
