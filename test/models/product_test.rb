require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	
	test "product price must be positive" do
		product = Product.new(title: "fdjkfjdk", description: "fdjfkdalfjdl", image_url: "fdfdf.jpg")
		
		product.price = -1
		assert product.invalid?
		assert_equal "must be greater than or equal to 0.01",
			product.errors[:price].first

		product.price = 0
		assert product.invalid?
		assert_equal "must be greater than or equal to 0.01",
			product.errors[:price].first
		
		product.price = 1
		assert product.valid?
	end
end
