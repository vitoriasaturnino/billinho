require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get registrations_index_url
    assert_response :success
  end

  test "should get show" do
    get registrations_show_url
    assert_response :success
  end

  test "should get create" do
    get registrations_create_url
    assert_response :success
  end
end
