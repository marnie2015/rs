class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.date :or_date
      t.string :or_number
      t.references :reservation, foreign_key: true
      t.string :remarks
      t.float :amount

      t.timestamps
    end
  end
end
