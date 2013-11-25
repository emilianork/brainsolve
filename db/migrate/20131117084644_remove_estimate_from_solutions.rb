class RemoveEstimateFromSolutions < ActiveRecord::Migration
  def up
    remove_column :solutions, :estimate
    add_column :solutions, :estimate, :string
  end

  def down
    remove_column :solutions, :estimate
    add_column :solutions, :estimate, :integer
  end

end
