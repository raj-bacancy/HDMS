require "test_helper"

class OwnerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owner_index_url
    assert_response :success
  end

  test "should get new" do
    get owner_new_url
    assert_response :success
  end
end
