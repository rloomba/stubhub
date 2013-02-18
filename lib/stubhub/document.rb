  module Stubhub
    class Document < OpenStruct

      def self.demodulize(class_name_in_module)
        class_name_in_module.to_s.gsub(/^.*::/, '')
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
