module Stubhub
  class Genre < Document
    def self.search(search_query, options = {})
      search_query = URI.escape(search_query)
      params = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                 "description" => "#{search_query}"}
      Client.make_request(Event, params, options = {})
    end

  end
end