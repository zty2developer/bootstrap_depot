class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

<<<<<<< HEAD
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
=======
	private
	 def current_cart
		 Cart.find(session[:cart_id])
	 rescue ActiveRecord::RecordNotFound
		 cart = Cart.create
		 session[:cart_id] = cart.id
		 cart
	 end
>>>>>>> 73193e1dffa2199d103b3e585e8aaf29caa577f0
end
