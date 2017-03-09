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
		line_items.to_a.sum {|item| item.total_price }.to_f
	end
end
