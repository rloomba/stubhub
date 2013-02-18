module Stubhub
  class Event < Document
    
    def self.find_by_event_id(event_id)
      options = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                 "event_id" => "#{event_id}"}
      Client.make_request(Event, options)
    end

    def self.search(search_query)
      search_query.gsub!(/\s+/, '+')
      options = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                 "description" => "#{search_query}"}
      Client.make_request(Event, options)
    end

  end
end
