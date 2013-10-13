class Problem < ActiveRecord::Base
  has_many :solutions, :dependent => :destroy
  belongs_to :user
end
