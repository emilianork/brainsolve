class RemoveCurrencyOfSolutions < ActiveRecord::Migration
  def change
    remove_column :solutions, :currency
  end
end
