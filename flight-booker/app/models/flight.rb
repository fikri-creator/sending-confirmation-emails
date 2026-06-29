class Flight < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings

  validates :from_airport, :to_airport, :departure, :duration, presence: true
  validates :duration, numericality: { greater_than: 0 }

  scope :matching, ->(from, to, passengers) {
    where(from_airport: from, to_airport: to)
      .where("capacity >= ?", passengers.to_i)
      .order(:departure)
  }

  def arrival
    departure + duration.minutes
  end
end