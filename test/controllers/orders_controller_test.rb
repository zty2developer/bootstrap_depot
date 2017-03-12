require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should redirected to root path if cart is empty" do
    get new_order_url
		assert_redirected_to store_index_path
		assert_equal flash[:notice], "Cart is Empty, Please add some book to your cart"
  end

	test "should get new" do
		cart = Cart.create
		LineItem.create(cart: cart, product: products(:one))
		session[:cart_id] = cart.id

		get new_order_url
		assert_response :success
	end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { address: @order.address, email: @order.email, name: @order.name, pay_type: @order.pay_type } }
    end

    assert_redirected_to store_index_path
		assert_equal flash[:notice], "Order was successfully created."
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { address: @order.address, email: @order.email, name: @order.name, pay_type: @order.pay_type } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
