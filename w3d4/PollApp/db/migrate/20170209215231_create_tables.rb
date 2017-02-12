class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.timestamps
    end

    create_table :polls do |t|
      t.string :title, null: false
      t.integer :author, null: false
      t.timestamps
    end

    create_table :questions do |t|
      t.string :text, null: false
      t.integer :poll_id, null: false
      t.timestamps
    end

    create_table :answer_choices do |t|
      t.string :text, null: false
      t.integer :question_id, null: false
      t.timestamps
    end

    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :answer_choice_id, null: false
      t.timestamps
    end
  end
end
