require 'spec_helper'
VENUE_ID = 285636

module Stubhub
  describe Venue do
    before :each do
      VCR.insert_cassette 'venue' do
      end
    end
    after :each do
      VCR.eject_cassette
    end

    context ".find_by_venue_id" do
      it "finds find the venue with venue id #{VENUE_ID}" do
        venue = Venue.find_by_venue_id(VENUE_ID)
        venue.venue_id.should eq(VENUE_ID.to_s)
      end
    end

    context ".search" do
      it "peforms a search for the keyword" do
        venues = Venue.search("Staples Center")
        venues.length.should be >= 1
      end
    end

  end
end