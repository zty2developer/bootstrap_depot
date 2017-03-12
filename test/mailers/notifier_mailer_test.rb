require 'test_helper'

class NotifierMailerTest < ActionMailer::TestCase
  test "order_received" do
    mail = NotifierMailer.order_received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
		assert_equal Array.new.push(orders(:one).email), mail.to
		assert_equal ["ztyemail@126.com"], mail.from
	end

  test "order_shipped" do
    mail = NotifierMailer.order_shipped(orders(:one))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
		assert_equal Array.new.push(orders(:one).email), mail.to
    assert_equal ["ztyemail@126.com"], mail.from
  end
end
