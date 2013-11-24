class AreasOfKnowledge < ActiveRecord::Base
  attr_accessible :name, :description, :created_at, :updated_at, :acronym
  has_many :problems
end
