# Seed sample flights so the search form has data on first run.
Flight.destroy_all

airports = %w[Jakarta Singapore Kuala Lumpur Bangkok Hongkong Tokyo]
now = Time.zone.now.change(sec: 0, min: 0)

flights = []
20.times do |i|
  from, to = airports.sample(2)
  flights << {
    from_airport: from,
    to_airport:   to,
    departure:    now + (i * 6).hours + rand(0..59).minutes,
    duration:     [60, 90, 120, 180, 240].sample,
    capacity:     [100, 150, 200].sample
  }
end

Flight.create!(flights)

puts "Created #{Flight.count} flights."
