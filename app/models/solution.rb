class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  def owner(user)
  	if user.nil?
  		return false
  	end
  	user_id == user.id
  end
end
