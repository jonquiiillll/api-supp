require "test_helper"

class IssuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get issues_index_url
    assert_response :success
  end

  test "should get create" do
    get issues_create_url
    assert_response :success
  end

  test "should get update" do
    get issues_update_url
    assert_response :success
  end

  test "should get destroy" do
    get issues_destroy_url
    assert_response :success
  end
end
