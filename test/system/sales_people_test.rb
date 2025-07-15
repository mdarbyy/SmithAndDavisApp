require "application_system_test_case"

class SalesPeopleTest < ApplicationSystemTestCase
  setup do
    @sales_person = sales_people(:one)
  end

  test "visiting the index" do
    visit sales_people_url
    assert_selector "h1", text: "Sales people"
  end

  test "should create sales person" do
    visit sales_people_url
    click_on "New sales person"

    fill_in "Employment date", with: @sales_person.employment_date
    fill_in "First name", with: @sales_person.first_name
    fill_in "Last name", with: @sales_person.last_name
    click_on "Create Sales person"

    assert_text "Sales person was successfully created"
    click_on "Back"
  end

  test "should update Sales person" do
    visit sales_person_url(@sales_person)
    click_on "Edit this sales person", match: :first

    fill_in "Employment date", with: @sales_person.employment_date
    fill_in "First name", with: @sales_person.first_name
    fill_in "Last name", with: @sales_person.last_name
    click_on "Update Sales person"

    assert_text "Sales person was successfully updated"
    click_on "Back"
  end

  test "should destroy Sales person" do
    visit sales_person_url(@sales_person)
    click_on "Destroy this sales person", match: :first

    assert_text "Sales person was successfully destroyed"
  end
end
