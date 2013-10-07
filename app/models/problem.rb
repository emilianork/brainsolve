class Problem < ActiveRecord::Base
  has_many :solutions
  belongs_to :user
end
