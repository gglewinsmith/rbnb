class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.integer :price_per_week
      t.text :description
      t.string :condition_of_device
      t.integer :age_of_device
      t.string :type_of_device
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
