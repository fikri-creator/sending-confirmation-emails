class PassengerMailer < ApplicationMailer
  # Subject can be set in I18n, at the model level, or passed inline.
  default from: 'no-reply@flightbooker.example'

  # Sends a booking confirmation to a single passenger.
  #
  # Two call styles are supported:
  #
  #   1. Classic (Assignment spec):
  #        PassengerMailer.confirmation_email(Passenger.first).deliver_now!
  #
  #   2. Modern ActionMailer params API (used by Booking#after_create):
  #        PassengerMailer.with(passenger: p, flight: f)
  #                       .confirmation_email
  #                       .deliver_now
  #
  # In Rails 6.1, both styles land here with `passenger` set in `params`.
  # The flight is looked up via the passenger's most recent booking if not given.
  def confirmation_email(passenger = nil)
    # Both call styles set params, but if not (defensive), fall back to the
    # method argument.
    safe_params = (respond_to?(:params) ? params : nil) || {}
    @passenger = passenger || safe_params[:passenger]
    @flight    = safe_params[:flight] || @passenger&.bookings&.last&.flight

    return if @passenger.nil? || @flight.nil?

    mail(
      to:      @passenger.email,
      subject: "You have booked your ticket — Flight #{@flight.id}"
    )
  end
end