class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	protected
	def current_cart
		begin
		  Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			cart = Cart.create
			session[:cart_id] = cart.id
			cart
		end
	end
end
