class StoreController < ApplicationController
  skip_before_action :authorize

  def index
		@categories = Category.all

		if params[:set_locale]
			redirect_to store_index_path(locale: params[:set_locale])
		else
			@cart = current_cart
			@products = Product.all.page(params[:page])
		end
  end

	def category
		category = Category.find(params[:category_id]) if params[:category_id]
		@products = category.products.page(params[:page]) if category
	end

	def about
	end

	def contact
	end

	# private
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def store_params
  #     params.require(:store).permit(:category_id)
  #   end
end
