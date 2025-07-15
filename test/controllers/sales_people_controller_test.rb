require "test_helper"

class SalesPeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_person = sales_people(:one)
  end

  test "should get index" do
    get sales_people_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_person_url
    assert_response :success
  end

  test "should create sales_person" do
    assert_difference("SalesPerson.count") do
      post sales_people_url, params: { sales_person: { employment_date: @sales_person.employment_date, first_name: @sales_person.first_name, last_name: @sales_person.last_name } }
    end

    assert_redirected_to sales_person_url(SalesPerson.last)
  end

  test "should show sales_person" do
    get sales_person_url(@sales_person)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_person_url(@sales_person)
    assert_response :success
  end

  test "should update sales_person" do
    patch sales_person_url(@sales_person), params: { sales_person: { employment_date: @sales_person.employment_date, first_name: @sales_person.first_name, last_name: @sales_person.last_name } }
    assert_redirected_to sales_person_url(@sales_person)
  end

  test "should destroy sales_person" do
    assert_difference("SalesPerson.count", -1) do
      delete sales_person_url(@sales_person)
    end

    assert_redirected_to sales_people_url
  end
end
