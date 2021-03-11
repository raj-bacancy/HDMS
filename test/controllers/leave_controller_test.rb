require "test_helper"

class LeaveControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get leave_show_url
    assert_response :success
  end

  test "should get index" do
    get leave_index_url
    assert_response :success
  end

  test "should get new" do
    get leave_new_url
    assert_response :success
  end
end
