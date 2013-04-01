module Stubhub
  class Geo < Document
      def self.find_by_geo_id(geo_id, options = {})
      params = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                "geoId" => "#{geo_id}"}
      Client.make_request(Geo, params, options)
    end

    # rough matching. i.e. "San Francisco" will match "San Diego" due to the "+San+"
    def self.find_by_locale(locale, options = {})
      params = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                "localeDescription" => "#{URI::escape(locale)}"}
      Client.make_request(Geo, params, options)
    end

    def self.search(search_query, options = {})
      search_query = URI.escape(search_query)
      params = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                "description" => "#{search_query}"}
      Client.make_request(Geo, params, options)
    end

    def events(options = {})
      params = {"stubhubDocumentType" => "event",
                "ancestorGeoIds" => "#{self.geoId}"}
      Client.make_request(Event, params, options)
    end
  end
end
