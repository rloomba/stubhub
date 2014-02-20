require 'spec_helper'

module Stubhub
  describe Client do
    context "::prepare_query" do
      it "converts params hash to proper url" do
        params = {"stubhubDocumentType" => "test",
                 "id" => "5"}
        url = Client.prepare_query(params, {})
        url.should include "q=stubhubDocumentType%3A%22test%22+AND+id%3A%225%22"
      end
      
      it 'allows overwriting of specific request options' do
        params = {"stubhubDocumentType" => "test",
                 "id" => "5"}
        url = Client.prepare_query(params, {"rows" => 90})
        url.should include "rows=90"
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