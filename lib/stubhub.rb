require 'json'
require 'httparty'
require 'ostruct'
require 'uri'

require_relative 'stubhub/document'
require_relative 'stubhub/client'
require_relative 'stubhub/event'
require_relative 'stubhub/genre'
require_relative 'stubhub/geo'
require_relative 'stubhub/ticket'
require_relative 'stubhub/venue'
require_relative 'stubhub/venue_zone_section'
require_relative 'stubhub/version'


module Stubhub
 
 # EXAMPLES -----------
 # doc types: event, venue, genre, geo (Geography), venue_zone_section (Venue Zone Section)
 # puts Stubhub::Ticket.find_by_ticket_id(487197960)
 # puts Stubhub::Event.find_by_event_id(4236091) => individual event
 # puts Stubhub::Event.search("swedish house mafia")
 # puts Stubhub::Venue.search("Oracle Arena")
 # puts Stubhub::Genre.search("ice show")
 # --------------------------
end

# options = {"stubhubDocumentType" => "genre",
#                  "description" => URI.escape("ice shows")}

# puts Stubhub::Client.convert_query_to_url(options)

# puts Stubhub::Venue.search("Oracle Arena")
 puts Stubhub::Genre.search("ice show")