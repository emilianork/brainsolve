class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :country
      t.string :acronym

      t.timestamps
    end
  end
end
