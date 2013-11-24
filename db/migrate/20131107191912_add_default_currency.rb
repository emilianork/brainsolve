class AddDefaultCurrency < ActiveRecord::Migration
  def up
  	Currency.create(country: "None", acronym: "None")
  end
  def down
	Currency.find_by_country_and_acronym("None","None").destroy if Currency.find_by_country_and_acronym("None","None")
  end
end
