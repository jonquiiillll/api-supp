require "test_helper"

class AdminProblemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_problems_index_url
    assert_response :success
  end
end
