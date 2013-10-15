class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  has_one :problem

attr_accessible :text, :estimate, :currency, :email, :telephone, :company, :company_telephone, :problem_id, :user_id

  def owner(user)
  	if user.nil?
  		return false
  	end
  	user_id == user.id
  end
end
