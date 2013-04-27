require 'spec_helper'

module Stubhub
  describe Client do
    context ".convert_query_to_url" do
      it "converts params hash to proper url" do
        params = {"stubhubDocumentType" => "test",
                 "id" => "5"}
        url = Client.convert_query_to_url(params, {})
        url.should eq "q=%2BstubhubDocumentType%3Atest+AND+%2Bid%3A5&wt=json"
      end
    end
    context ".defaults" do
      it "returns a default options hash" do 
        Client.defaults.should be_a(Hash)
      end
      it "returns actual optoins in a hash" do
        Client.defaults.length.should be >= 1
      end
    end
  end
end