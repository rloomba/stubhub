module Stubhub
  class Event < Document
    
    def self.find_by_event_id(event_id)
      options = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                 "event_id" => "#{event_id}"}
      Client.make_request(Event, options)
    end

    def self.search(search_query)
      search_query = URI.escape(search_query)
      options = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                 "description" => "#{search_query}"}
      Client.make_request(Event, options)
    end

    def tickets
      options = {"stubhubDocumentType" => "ticket",
                 "event_id" => "#{self.event_id}"}
      Client.make_request(Ticket, options)
    end

  end
end
