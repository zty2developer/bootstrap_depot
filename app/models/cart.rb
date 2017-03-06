class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy

	def add_product(product_id)
		line_item = line_items.find_by_product_id(product_id)

		if line_item
			line_item.quantity += 1
		else
			line_item = LineItem.create(cart_id: self.id, product_id: product_id)
		end
		line_item
	end

	def total
		sum = 0
		line_items.each do |item|
			sum += item.quantity * item.product.price
		end
		sum.to_f
	end
end
