class AddNotificationIdToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :notification_id, :integer
  end
end
