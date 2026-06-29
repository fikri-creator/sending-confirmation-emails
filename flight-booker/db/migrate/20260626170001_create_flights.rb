class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string  :from_airport, null: false
      t.string  :to_airport,   null: false
      t.datetime :departure,   null: false
      t.integer :duration,    null: false, default: 0   # minutes
      t.integer :capacity,    null: false, default: 100

      t.timestamps
    end

    add_index :flights, %i[from_airport to_airport departure]
  end
end