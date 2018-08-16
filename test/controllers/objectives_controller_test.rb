require 'test_helper'

class ObjectivesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get objectives_create_url
    assert_response :success
  end

  test "should get edit" do
    get objectives_edit_url
    assert_response :success
  end

end
