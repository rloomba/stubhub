require 'spec_helper'

SECTION_ID = 62048

module Stubhub
  describe Venue do
    before :each do
      VCR.insert_cassette 'venue_zone_section' do
      end
    end
    after :each do
      VCR.eject_cassette
    end

    context ".find_by_venue_id" do
      it "finds find the section with section id #{SECTION_ID}" do
        section = VenueZoneSection.find_by_section_id(SECTION_ID)
        section.venue_section_id.should eq(SECTION_ID.to_s)
      end
    end
    
  end
end
