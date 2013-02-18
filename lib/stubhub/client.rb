module Stubhub
  module Client
    include HTTParty

    base_uri "http://www.stubhub.com/listingCatalog/select/?q="
    format :json

    def self.convert_query_to_url(options)
      options.map do |k,v|
        "%2B+#{k}%3A#{v}%0D%0A"
      end.join << '&start=0&rows=10&wt=json'
    end

    def self.make_request(klass, options)
      query_url = convert_query_to_url(options)
      result = get(query_url)
      parsed_result = JSON.parse(result.body)
      parsed_result["response"]["docs"].map do |doc|
        klass.new(doc)
      end
    end

  end
end