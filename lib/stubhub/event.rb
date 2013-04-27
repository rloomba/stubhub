module Stubhub
  class Event < Document
    
    def self.find_by_event_id(event_id, options = {})
      params = { :event_id => event_id }
      find(params, options)
    end

    def self.search(search_query, options = {})
      params = { :description => search_query }
      find(params, options)
    end

    def tickets(params = {}, options = {})
      params.merge!( :event_id => event_id )
      Ticket.find(params, options)
    end

  end
end
