class StoreController < ApplicationController
  skip_before_action :authorize

  def index
		@cart = current_cart
		@products = Product.all.page(params[:page])
  end
end
