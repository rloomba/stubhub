module Stubhub
  class Ticket < Document

    def self.find_by_ticket_id(ticket_id)
      options = {"stubhubDocumentType" => "#{demodulize(self).downcase}",
                 "id" => "#{ticket_id}"}
      Client.make_request(Ticket, options)
    end


  end
end