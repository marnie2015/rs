class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :title
      t.string :description
      t.float :amount
      t.string :status
      t.string :url1
      t.string :url2
      t.string :url3
      t.string :url4
      t.string :url5

      t.timestamps
    end
  end
end
