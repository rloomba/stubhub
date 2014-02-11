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
      
      it 'allows overwriting of specific request options' do
        params = {"stubhubDocumentType" => "test",
                 "id" => "5"}
        url = Client.convert_query_to_url(params, {"rows" => 90})
        url.should eq "%2B+stubhubDocumentType%3Atest%0D%0A%2B+id%3A5%0D%0A&start=0&rows=90&wt=json"
      end 

    end

    context ".defaults" do
      it "returns a default options hash" do 
        Client.defaults.should be_a(Hash)
      end
      it "returns actual options in a hash" do
        Client.defaults.length.should be >= 1
      end
    end

  end
end