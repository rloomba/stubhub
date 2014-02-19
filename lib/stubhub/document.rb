  module Stubhub
    class Document < OpenStruct

      def self.find(params={},options = {})
        params.merge!( :stubhubDocumentType => demodulize.downcase )
        Client.make_request(self,params,options) if ancestors[1] == Stubhub::Document
      end

      def self.demodulize
        to_s.gsub(/^.*::/, '')
      end

      def fields
        @table.keys.map{|k| k.to_s}
      end

      def initialize(data = {})
        raise ArgumentError, "Invalid data passed to Document.new: #{data.inspect}" unless data.is_a?(Hash)
        super(data)
      end

    end
  end
