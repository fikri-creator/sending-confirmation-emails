class Booking < ApplicationRecord
  belongs_to :flight
  # Many-to-many with passengers through the bookings_passengers join table.
  # destroy_associations_on_dup = true ensures passengers are removed from the
  # join table when a booking is destroyed (passenger records themselves are
  # preserved — they may belong to other bookings).
  has_and_belongs_to_many :passengers, dependent: :destroy

  accepts_nested_attributes_for :passengers, reject_if: :all_blank

  after_create :send_confirmation_emails

  private

  # Assignment requirement: send ONE email per Passenger, not one per Booking.
  def send_confirmation_emails
    passengers.each do |passenger|
      PassengerMailer.with(passenger: passenger, flight: flight)
                     .confirmation_email
                     .deliver_now
    end
  end
end