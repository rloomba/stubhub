# Stubhub

A gem for accessing the StubHub API

## Installation

Add this line to your application's Gemfile:

    gem 'stubhub'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stubhub

## Usage

Examples

```ruby

# find a ticket by ticket id
Stubhub::Ticket.find_by_ticket_id(487197960) # => returns a Ticket object

# find an event by event id
Stubhub::Event.find_by_event_id(4236091) # => returns an Event object

# find tickets for an specific event
  # first find the event
  event = Stubhub::Event.find_by_event_id(4236091) # => returns an Event object
  # then call tickets method on that event
  event.tickets # => returns an array of ticket objects

# search for an event 
  Stubhub::Event.search("swedish house mafia") # => returns an Event object

# search for a venue
  Stubhub::Venue.search("Oracle Arena") # => returns a Venue object

# search for a genre  
 Stubhub::Genre.search("ice show") # => returns a Genre object

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
