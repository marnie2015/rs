class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.string :reservation_time
      t.string :package
      t.float :amount
      t.string :status
      t.references :client, foreign_key: true
      t.string :place_of_church
      t.string :place_of_coverage
      t.string :reception
      t.string :recommended_by
      t.string :tape
      t.string :coverage
      t.string :album
      t.string :motif
      t.string :excess_shots
      t.string :free

      t.timestamps
    end
  end
end
