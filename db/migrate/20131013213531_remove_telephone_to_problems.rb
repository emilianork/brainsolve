class RemoveTelephoneToProblems < ActiveRecord::Migration 
  def up
    remove_column :problems, :telephone
    add_column :problems, :telephone, :string
  end
  def down
    remove_column :problems, :telephone
    add_column :problems, :telephone, :integer
  end
end
