class RemoveTelephoneToUsers < ActiveRecord::Migration
  def up
    remove_column :users, :telephone
    add_column :users, :telephone, :string
  end
  def down
    remove_column :users, :telephone
    add_column :users, :telephone, :integer
  end
end
