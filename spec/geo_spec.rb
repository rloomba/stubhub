require 'spec_helper'
GEO_ID = 81989
LOCALE = "SF Bay Area"

module Stubhub
  describe Geo do
    before :each do
      VCR.insert_cassette 'geo' do
      end
    end
    after :each do
      VCR.eject_cassette
    end

    context ".find_by_geo_id" do
      it "finds the geo with geoId #{GEO_ID}" do
        geo = Geo.find_by_geo_id(GEO_ID, :rows => 1)
        geo.id.should eq(GEO_ID.to_s)
      end
    end

    context ".find_by_locale" do
      it "finds the geos within the locale #{LOCALE}" do
        geos = Geo.find_by_locale(LOCALE, :rows => 2)
        geos.length.should be >= 1
      end
    end

    context ".search" do
      it "peforms a geo search for the keyword" do
        geos = Geo.search("Hawaii", :rows => 2)
        geos.length.should be >= 1
      end
    end

  end
end