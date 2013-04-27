module Stubhub
  module Client
    include HTTParty

    format :json

    def self.make_request(klass, params, options = {})
      require 'cgi' unless defined?(CGI) && defined?(CGI::escape)
      path = options.delete(:path) || "listingCatalog/select"
      query_url = convert_query_to_url(params, options)
      result = get("http://partner-feed.stubhub.com/#{path}/?#{query_url}")
      parse(result.body,klass)
    end

    def self.convert_query_to_url(params, options = {})
      query = {:q => convert_solr_params(params) }
      url_params = convert_url_params( [query, defaults.merge(options)] )
    end

    def self.convert_solr_params(params)
      params.map do |k,v|
        v = "\"#{v}\"" if k =~ /description/i
        "+#{k}:#{v}" 
      end.join(" AND ")
    end

    def self.convert_url_params(url_params) # Array of hashes
      url_params.map do |param|
        param.map { |k,v| "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}" }.join("&")
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