class SessionsController < ApplicationController
	skip_before_action :authorize, only: [:new, :create]
  def new
  end

  def create
		if user = User.authenticate(params[:name], params[:password])
			session[:user_id] = user.id
			redirect_to admin_index_url
		else
			redirect_to login_url, alert: "Invalid user/password combination"
		end
  end

  def destroy
		session[:user_id] = nil
		redirect_to store_index_path, notice: "Successfully Log Out!"
  end
end