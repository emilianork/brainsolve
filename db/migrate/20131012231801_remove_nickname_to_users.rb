class RemoveNicknameToUsers < ActiveRecord::Migration
  def up
    remove_column :users, :nickname
    add_column :users, :nickname, :string
  end
  def down
    remove_column :users, :nickname
    add_column :users, :nickname, :integer
  end
end
