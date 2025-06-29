require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit orders_url
    click_on "New order"

    fill_in "Customer", with: @order.customer_id
    fill_in "Delivery date", with: @order.delivery_date
    fill_in "Delivery status", with: @order.delivery_status
    fill_in "Employee", with: @order.employee_id
    fill_in "Order date", with: @order.order_date
    fill_in "Payment status", with: @order.payment_status
    fill_in "Total price", with: @order.total_price
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit order_url(@order)
    click_on "Edit this order", match: :first

    fill_in "Customer", with: @order.customer_id
    fill_in "Delivery date", with: @order.delivery_date
    fill_in "Delivery status", with: @order.delivery_status
    fill_in "Employee", with: @order.employee_id
    fill_in "Order date", with: @order.order_date
    fill_in "Payment status", with: @order.payment_status
    fill_in "Total price", with: @order.total_price
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit order_url(@order)
    click_on "Destroy this order", match: :first

    assert_text "Order was successfully destroyed"
  end
end
