module Stubhub
  class Geo < Document
    def self.find_by_geo_id(geo_id, options = {})
      params = { :geoId => geo_id }
      find(params, options)
    end

    # rough matching. i.e. "San Francisco" will match "San Diego" due to the "+San+"
    def self.find_by_locale(locale, options = {})
      params = { :localeDescription => locale }
      find(params, options)
    end

    def self.search(search_query, options = {})
      params = { :description => search_query }
      find(params, options)
    end

    def events(options = {})
      params = { :ancestorGeoIds => geoId }
      Event.find(params, options)
    end
  end
end
