class Notification < ActiveRecord::Base
  attr_accessible :solution_id, :problem_id, :user_id, :view, :created_at, :updated_at
  
  belongs_to :solution
  belongs_to :problem
  belongs_to :user
  
  after_destroy do
    solution.update_attributes(:notification_id => nil)
  end
end
