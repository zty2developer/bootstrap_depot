class StoreController < ApplicationController
  def index
		@cart = current_cart
		@products = Product.all.page(params[:page])
  end
end
