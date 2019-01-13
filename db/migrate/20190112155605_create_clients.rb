class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :fname
      t.string :mname
      t.string :lname
      t.string :contact

      t.timestamps
    end
  end
end
