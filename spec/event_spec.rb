require 'spec_helper'
EVENT_ID = 4187540

module Stubhub
  describe Event do
    before :each do
      VCR.insert_cassette 'event' do
      end
    end
    after :each do
      VCR.eject_cassette
    end

    context ".find_by_event_id" do
      it "finds find the event with event id #{EVENT_ID}" do
        event = Event.find_by_event_id(EVENT_ID)
        event.id.should eq(EVENT_ID.to_s)
      end
    end

    context ".search" do
      it "peforms a search for the keyword" do
        event = Event.search("above and beyond")
        event.length.should be >= 1
      end
    end

  end
end