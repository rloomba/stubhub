module Stubhub
  class Genre < Document
    def self.search(search_query)
      search_query = URI.escape(search_query)
      options = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                 "description" => "#{search_query}"}
      Client.make_request(Event, options)
    end

  end
end