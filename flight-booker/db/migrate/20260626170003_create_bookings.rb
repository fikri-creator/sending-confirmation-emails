class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :flight, null: false, foreign_key: true

      t.timestamps
    end

    # Many-to-many between bookings and passengers. The join table has no
    # primary key, no timestamps, and no model — it's managed by has_and_belongs_to_many.
    create_join_table :bookings, :passengers do |t|
      t.index :booking_id
      t.index :passenger_id
    end
  end
end