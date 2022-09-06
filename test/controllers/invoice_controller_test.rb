require "test_helper"

class InvoiceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get invoice_index_url
    assert_response :success
  end

  test "should get show" do
    get invoice_show_url
    assert_response :success
  end

  test "should get create" do
    get invoice_create_url
    assert_response :success
  end
end
