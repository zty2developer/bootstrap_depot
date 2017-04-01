class Order < ApplicationRecord
	paginates_per 10
	has_many :line_items, dependent: :destroy
	PAYMENT_TYPES = ["Credit", "Wechat", "Alipay"]
	validates :name, :email, :address, :pay_type, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES

	def add_line_items_from_cart(cart)
	  cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end
end
