class AddStartDateToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :start_time, :datetime
  end
end
