class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :solution_id
      t.integer :problem_id
      t.integer :user_id
      t.boolean :view

      t.timestamps
    end
  end
end
