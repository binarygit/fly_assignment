require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get network_test" do
    get static_pages_network_test_url
    assert_response :success
  end
end
