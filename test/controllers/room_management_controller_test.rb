require "test_helper"

class RoomManagementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get room_management_index_url
    assert_response :success
  end

  test "should get new" do
    get room_management_new_url
    assert_response :success
  end

  test "should get show" do
    get room_management_show_url
    assert_response :success
  end
end
