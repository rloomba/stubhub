module Stubhub
  class ProxyClient < Client
    class << self
      def get(url)
        p url
      end

    end
  end
end