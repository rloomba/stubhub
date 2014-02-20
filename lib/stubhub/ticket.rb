module Stubhub
  class Ticket < Document

    def self.find_by_ticket_id(ticket_id, options = {})
      params = { :id => ticket_id }
      find(params,options)
    end

    def self.client
      ENV['PROXY_ADDRESS'] ? ProxyClient : Client
    end

  end
end