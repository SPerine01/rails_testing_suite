class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.find_by_username(params[:username])
		session[:user_id] = user.id
		redirect_to user_path
	else
		redirect_to root_path
	end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've successfully signed out."
    redirect_to root_path
  end
end
