require "application_system_test_case"

class SalesRecordsTest < ApplicationSystemTestCase
  setup do
    @sales_record = sales_records(:one)
  end

  test "visiting the index" do
    visit sales_records_url
    assert_selector "h1", text: "Sales records"
  end

  test "should create sales record" do
    visit sales_records_url
    click_on "New sales record"

    fill_in "Salesperson", with: @sales_record.SalesPerson_id
    fill_in "Item name", with: @sales_record.item_name
    fill_in "Item price", with: @sales_record.item_price
    fill_in "Sell date", with: @sales_record.sell_date
    click_on "Create Sales record"

    assert_text "Sales record was successfully created"
    click_on "Back"
  end

  test "should update Sales record" do
    visit sales_record_url(@sales_record)
    click_on "Edit this sales record", match: :first

    fill_in "Salesperson", with: @sales_record.SalesPerson_id
    fill_in "Item name", with: @sales_record.item_name
    fill_in "Item price", with: @sales_record.item_price
    fill_in "Sell date", with: @sales_record.sell_date
    click_on "Update Sales record"

    assert_text "Sales record was successfully updated"
    click_on "Back"
  end

  test "should destroy Sales record" do
    visit sales_record_url(@sales_record)
    click_on "Destroy this sales record", match: :first

    assert_text "Sales record was successfully destroyed"
  end
end
