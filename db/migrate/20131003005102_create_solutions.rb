class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :text, :null => false
      t.integer :estimate
      t.string :currency
      t.string :email, :null => false
      t.integer :telephone
      t.string :company
      t.integer :company_telephone
      t.integer :problem_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
