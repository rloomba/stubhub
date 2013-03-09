module Stubhub
  class Event < Document
    
    def self.find_by_event_id(event_id, options = {})
      params = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                 "event_id" => "#{event_id}"}
      Client.make_request(Event, params, options)
    end

    def self.search(search_query, options = {})
      search_query = URI.escape(search_query)
      params = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                 "description" => "#{search_query}"}
      Client.make_request(Event, params, options)
    end

    def tickets(options = {})
      params = {"stubhubDocumentType" => "ticket",
                 "event_id" => "#{self.event_id}"}
      Client.make_request(Ticket, params, options)
    end

  end
end
