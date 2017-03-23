class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :authorize
	before_action :set_i18n_locale_from_params

	protected
   def authorize
		 unless User.find_by_id(session[:user_id])
			 redirect_to login_url, notice: "Please Log in"
		 end
   end

	 def set_i18n_locale_from_params
		 if params[:locale]
			 if I18n.available_locales.include?(params[:locale].to_sym)
				 I18n.locale = params[:locale].to_sym
			 else
				 flash[:notice] = "#{params[:locale]} translation not available"
				 logger.error flash[:notice]
			 end
		 end
	 end

	 def default_url_options
		 { locale: I18n.locale }
	 end

	private
	 def current_cart
		 Cart.find(session[:cart_id])
	 rescue ActiveRecord::RecordNotFound
		 cart = Cart.create
		 session[:cart_id] = cart.id
		 cart
	 end
end
