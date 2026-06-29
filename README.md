# Sending Confirmation Emails

Odin Project — Ruby on Rails assignment.

The Rails app lives in [`flight-booker/`](flight-booker/). It extends the
Flight Booker project to send "You have booked your ticket" confirmation emails
to every Passenger on a Booking.

See [flight-booker/README.md](flight-booker/README.md) for full setup, run and
testing instructions.

## What this assignment covers

1. Generate `PassengerMailer` and add `letter_opener` gem for dev previews.
2. Build `.html.erb` + `.text.erb` confirmation templates.
3. Wire `Booking#after_create` to dispatch **one email per Passenger**.
4. Verify delivery end-to-end through the browser flow and from the Rails
   console.
