module MaropostApi
  class Client
    module Contacts
      def contact_upsert(list_ids:, params:)
        @list_ids = list_ids
        @request.post(endpoint: "contacts.json?list_ids=#{@list_ids}", params: params)
      end
    end
  end
end
