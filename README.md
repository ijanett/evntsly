# evntsly

evntsly is a simple MVC Ruby app built with Sinatra that provides a list of events from the seeded database. This app allows a user to: 
   - signup/login/logout
   - rsvp to events
   - un-rsvp to events
   - see a list of all events they've rsvp'd to
   - edit user account information

Future updates may include:
   - ability to signup/login as an event planner
   - an event planner would be able to create/edit their events as needed.
   - section for commenting/asking questions in an individual event's page.
   - design improvements

## Installation

Clone this repository and run:
```bundle``` then ```rake db:setup```

## Usage

Run:
```shotgun``` in your terminal and visit ```http://localhost:9393``` in your browser to start the app locally.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ijanett/evntsly. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

evntsly is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).