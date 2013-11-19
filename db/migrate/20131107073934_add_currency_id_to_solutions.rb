class AddCurrencyIdToSolutions < ActiveRecord::Migration
  def change
  	add_column :solutions, :currency_id, :integer
  end
end
