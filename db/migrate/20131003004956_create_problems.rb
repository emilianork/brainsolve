class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.text :title, :null => false
      t.string :contact
      t.text :description, :null => false
      t.integer :telephone
      t.string :areas_of_knowledge, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
