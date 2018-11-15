class AddEndDateToBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :end_of_renting, :date
  end
end
