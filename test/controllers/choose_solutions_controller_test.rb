require 'test_helper'

class ChooseSolutionsControllerTest < ActionController::TestCase
  test "should get choose_solution" do
    get :choose_solution
    assert_response :success
  end

  test "should get notification_view" do
    get :notification_view
    assert_response :success
  end

end
