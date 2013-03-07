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
 #
 # find a ticket by ticket id 
 # Stubhub::Ticket.find_by_ticket_id(487197960)
 #
 # Stubhub::Event.find_by_event_id(4236091) => individual event
 #
 # puts Stubhub::Event.search("swedish house mafia")
 # puts Stubhub::Venue.search("Oracle Arena")
 # puts Stubhub::Genre.search("ice show")
 #
 # event = Stubhub::Event.find_by_event_id(4242261).first
 # event.tickets => returns an array of tickets for given event
 # --------------------------
end
