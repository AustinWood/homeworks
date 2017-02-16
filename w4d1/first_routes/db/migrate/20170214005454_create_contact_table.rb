class CreateContactTable < ActiveRecord::Migration
  def change

    drop_table :users

    create_table :users do |t|
      t.string :username, null: false
      t.timestamps
    end

    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index(:contacts, [:email, :user_id], :unique => true)

    create_table :contact_shares do |t|
      t.integer :contact_id, null: false
      t.integer :user_id, null: false
    end

    add_index(:contact_shares, [:contact_id, :user_id], :unique => true)
  end
end
