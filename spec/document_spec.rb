require 'spec_helper'

module Stubhub
  describe Document do
    context "#initialize" do
      it 'raises an error if passed wrong data' do
        expect {
          Document.new(1)}.to raise_error(ArgumentError) 
      end
    end

    context "#fields" do
      it 'returns an array of keys for a hash' do
        Document.new({a:1, b:2}).fields.should eq(["a","b"])
      end
    end

    context ".demodulize" do
      it "returns only the class name without a namespace" do
        Stubhub::Ticket.demodulize.should eq "Ticket"
      end
    end

  end
end