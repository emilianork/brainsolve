class Currency < ActiveRecord::Base
	attr_accessible :country, :acronym, :created_at, :updated_at
	has_many :solutions
end
