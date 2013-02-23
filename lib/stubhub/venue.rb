module Stubhub
  class Venue < Document
     def self.find_by_venue_id(venue_id)
      options = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                 "venue_id" => "#{venue_id}"}
      Client.make_request(Venue, options)
    end

    def self.search(search_query)
      search_query = URI.escape(search_query)
      options = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                 "description" => "#{search_query}"}
      Client.make_request(Venue, options)
    end

  end
end