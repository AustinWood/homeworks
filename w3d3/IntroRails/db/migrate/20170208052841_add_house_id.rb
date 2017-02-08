class AddHouseId < ActiveRecord::Migration
  def change
    create_table :persons do |t|
      t.string :name, null: false
      t.timestamps
      t.integer :house_id
    end
  end
end
