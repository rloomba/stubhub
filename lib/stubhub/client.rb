module Stubhub
  class Client
    BASE_URL = 'http://partner-feed.stubhub.com'

    class << self
      def make_request(klass, params, options={})
        require 'cgi' unless defined?(CGI) && defined?(CGI::escape)
        path = options.delete(:path) || "listingCatalog/select"
        query = prepare_query(params, options)
        result = get("#{BASE_URL}/#{path}/?#{query}")
        parse(result.body,klass)
      end

      def prepare_query(params, options={})
        query = {:q => solr_dump(params) }
        hash_to_params( defaults.merge(options).merge(query) )
      end

      def solr_dump(params)
        params.map do |k,v|
          "#{k}:\"#{v}\""
        end.join(' AND ')
      end

      def hash_to_params(params={})
        params.map do |k,v|
          "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}"
        end.join("&")
      end

      def parse(body,klass)
        parsed_result = JSON.parse(body)
        objects = parsed_result["response"]["docs"].map { |doc| klass.new(doc) }
        objects.length == 1 ? objects.first : objects
      end

      def defaults
        {
          :rows => 999999,
          :wt   => "json"
        }
      end

      private

        def get(url)
          uri = URI(url)
          Net::HTTP.new(uri.host,uri.port).start do |http|
            http.get(uri)
          end
        end
    end

  end
end

# http://partner-feed.stubhub.com/listingCatalog/select/?q=stubhubDocumentType:event