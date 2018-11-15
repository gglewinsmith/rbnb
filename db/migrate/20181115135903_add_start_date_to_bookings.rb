class AddStartDateToBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :start_of_renting, :date
  end
end
