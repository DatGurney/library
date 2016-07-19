require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get quick_checkout" do
    get :quick_checkout
    assert_response :success
  end

  test "should get quick_return" do
    get :quick_return
    assert_response :success
  end

end
