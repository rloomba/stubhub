module Stubhub
  class Venue < Document
     def self.find_by_venue_id(venue_id, options = {})
      params = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                 "venue_id" => "#{venue_id}"}
      Client.make_request(Venue, params, options = {})
    end

    def self.search(search_query, options = {})
      search_query = URI.escape(search_query)
      params = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                 "description" => "#{search_query}"}
      Client.make_request(Venue, params, options = {})
    end

  end
end