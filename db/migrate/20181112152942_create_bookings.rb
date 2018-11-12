class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_of_renting
      t.datetime :end_of_renting
      t.references :user, foreign_key: true
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
