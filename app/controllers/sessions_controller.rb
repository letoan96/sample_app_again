class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(:email => params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		log_in(user)
  		redirect_to current_user
  	else
  		flash.now[:danger] = 'Invalid email/password!'
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	flash[:warning] = 'Logged out!!!'
  	redirect_to root_url
  end
end
