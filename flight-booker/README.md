# Flight Booker — Sending Confirmation Emails

A Flight Booker project extended to send confirmation emails to every Passenger
when a new Booking is created.

## Stack

- Ruby 2.7.8 (asdf)
- Rails 6.1.7.10
- SQLite 3
- `letter_opener` 1.10 (development only)

## Setup

```sh
bundle install
rails db:create db:migrate db:seed
```

## Run the server

```sh
DISABLE_SPRING=1 bundle exec rails server
```

Then visit <http://localhost:3000/>.

## Test the mailer

The classic Assignment trick (one-liner from the Rails console):

```sh
DISABLE_SPRING=1 bundle exec rails runner \
  'PassengerMailer.confirmation_email(Passenger.first).deliver_now!'
```

End-to-end booking flow (creates a booking, then verifies emails):

```sh
DISABLE_SPRING=1 bundle exec rails runner tmp/booking_flow_test.rb
```

## How the mailer is wired up

`Booking#after_create` calls
`PassengerMailer.with(passenger:, flight:).confirmation_email.deliver_now` once
per Passenger. The mailer also supports the Assignment's classic
`PassengerMailer.confirmation_email(Passenger.first).deliver_now!` signature.

## Where to find the rendered emails

`letter_opener` writes each delivered email under `tmp/letter_opener/<id>/rich.html`
and `tmp/letter_opener/<id>/plain.html`. The gem pops open the browser
automatically when an email is delivered.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
