require "test_helper"

class EducationalInstitutionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get educational_institution_index_url
    assert_response :success
  end
end
