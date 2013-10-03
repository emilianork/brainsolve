require 'test_helper'

class SolutionsControllerTest < ActionController::TestCase
  setup do
    @solution = solutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create solution" do
    assert_difference('Solution.count') do
      post :create, solution: { company: @solution.company, company_telephone: @solution.company_telephone, currency: @solution.currency, email: @solution.email, estimate: @solution.estimate, problem_id: @solution.problem_id, telephone: @solution.telephone, text: @solution.text, user_id: @solution.user_id }
    end

    assert_redirected_to solution_path(assigns(:solution))
  end

  test "should show solution" do
    get :show, id: @solution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @solution
    assert_response :success
  end

  test "should update solution" do
    patch :update, id: @solution, solution: { company: @solution.company, company_telephone: @solution.company_telephone, currency: @solution.currency, email: @solution.email, estimate: @solution.estimate, problem_id: @solution.problem_id, telephone: @solution.telephone, text: @solution.text, user_id: @solution.user_id }
    assert_redirected_to solution_path(assigns(:solution))
  end

  test "should destroy solution" do
    assert_difference('Solution.count', -1) do
      delete :destroy, id: @solution
    end

    assert_redirected_to solutions_path
  end
end
