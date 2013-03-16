require 'spec_helper'

module Stubhub
  describe Ticket do
    before :each do
      VCR.insert_cassette 'ticket' do
      end
    end
    after :each do
      VCR.eject_cassette
    end

    context ".find_by_ticket_id" do
      it "should find the ticket with ticket_id 488218079" do
        ticket = Ticket.find_by_ticket_id(488218079)
        ticket.id.should eq("488218079")
      end
    end

  end
end