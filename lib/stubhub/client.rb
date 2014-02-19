module Stubhub
  module Client
    include HTTParty

    format :json

    BASE_URL = 'http://partner-feed.stubhub.com'

    def self.make_request(klass, params, options={})
      require 'cgi' unless defined?(CGI) && defined?(CGI::escape)
      path = options.delete(:path) || "listingCatalog/select"
      query = prepare_query(params, options)
      result = get("#{BASE_URL}/#{path}/?#{query}")
      parse(result.body,klass)
    end

    def self.prepare_query(params, options={})
      query = {:q => solr_dump(params) }
      hash_to_params( defaults.merge(options).merge(query) )
    end

    def self.solr_dump(params)
      params.map do |k,v|
        "#{k}:\"#{v}\""
      end.join(' AND ')
    end

    def self.hash_to_params(params={})
      params.map do |k,v|
        "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}"
      end.join("&")
    end

    def self.parse(body,klass)
      parsed_result = JSON.parse(body)
      objects = parsed_result["response"]["docs"].map { |doc| klass.new(doc) }
      objects.length == 1 ? objects.first : objects
    end

    def self.defaults
        {
          # "start"   => 0,
          # "rows"    => 10,
          :wt      => "json"
        }
      end

  end
end

# http://partner-feed.stubhub.com/listingCatalog/select/?q=stubhubDocumentType:event