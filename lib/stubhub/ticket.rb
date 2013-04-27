module Stubhub
  class Ticket < Document

    def self.find_by_ticket_id(ticket_id, options = {})
      params = { :id => ticket_id }
      find(params,options)
    end


  end
end