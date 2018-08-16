require "application_system_test_case"

class StaffsTest < ApplicationSystemTestCase
  setup do
    @staff = staffs(:one)
  end

  test "visiting the index" do
    visit staffs_url
    assert_selector "h1", text: "Staffs"
  end

  test "creating a Staff" do
    visit staffs_url
    click_on "New Staff"

    fill_in "Dep 1st", with: @staff.dep_1st
    fill_in "Dep 2nd", with: @staff.dep_2nd
    fill_in "Dep 3rd", with: @staff.dep_3rd
    fill_in "Dep Bunshitsu", with: @staff.dep_bunshitsu
    fill_in "Department", with: @staff.department
    fill_in "Email", with: @staff.email
    fill_in "Name", with: @staff.name
    fill_in "Position", with: @staff.position
    fill_in "Staff No", with: @staff.staff_no
    click_on "Create Staff"

    assert_text "Staff was successfully created"
    click_on "Back"
  end

  test "updating a Staff" do
    visit staffs_url
    click_on "Edit", match: :first

    fill_in "Dep 1st", with: @staff.dep_1st
    fill_in "Dep 2nd", with: @staff.dep_2nd
    fill_in "Dep 3rd", with: @staff.dep_3rd
    fill_in "Dep Bunshitsu", with: @staff.dep_bunshitsu
    fill_in "Department", with: @staff.department
    fill_in "Email", with: @staff.email
    fill_in "Name", with: @staff.name
    fill_in "Position", with: @staff.position
    fill_in "Staff No", with: @staff.staff_no
    click_on "Update Staff"

    assert_text "Staff was successfully updated"
    click_on "Back"
  end

  test "destroying a Staff" do
    visit staffs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Staff was successfully destroyed"
  end
end
