class StoreController < ApplicationController
  skip_before_action :authorize

  def index
		if params[:set_locale]
			redirect_to store_index_path(locale: params[:set_locale])
		else
			@cart = current_cart
			@products = Product.all.page(params[:page])
		end
  end
end
