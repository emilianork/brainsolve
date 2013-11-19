class AddDefaultCurrencies < ActiveRecord::Migration
  def up
  	Currency.create(country: "México", acronym: "MX")
  	Currency.create(country: "United States Of America", acronym: "US")
  end

  def down
  	Currency.find_by_acronym("MX").destroy if Currency.find_by_acronym("MX")
  	Currency.find_by_acronym("US").destroy if Currency.find_by_acronym("US")
  end
end
