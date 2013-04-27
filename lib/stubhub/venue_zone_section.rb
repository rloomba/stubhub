module Stubhub
  class VenueZoneSection < Document

    def self.find(params, options = {})
      options.merge!({ :path => "listingCatalog/venue_zone_section/select" })
      Client.make_request(self, params, options)
    end

    def self.find_by_section_id(section_id,options = {})
      params = { :venue_section_id => section_id }
      find(params,options)
    end
    
  end
end