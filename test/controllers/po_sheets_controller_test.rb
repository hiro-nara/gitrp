require 'test_helper'

class PoSheetsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get po_sheets_create_url
    assert_response :success
  end

  test "should get edit" do
    get po_sheets_edit_url
    assert_response :success
  end

  test "should get sheets_all" do
    get po_sheets_sheets_all_url
    assert_response :success
  end

end
