module Stubhub
  class Venue < Document
     def self.find_by_venue_id(venue_id, options = {})
      params = { :venue_id => venue_id }
      find(params, options)
    end

    def self.search(search_query, options = {})
      params = { :description => search_query }
      find(params, options)
    end

    def sections(params = {},options = {})
      params.merge!({ :venue_config_id => venue_config_id })
      VenueZoneSection.find(params,options)
    end
    alias_method :zones, :sections

  end
end