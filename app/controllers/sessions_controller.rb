class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!

  def new
  end

  def create
    reset_session
    
    user = User.where(:username => params[:username]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid username or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_url, :notice => "Logged out!"
  end
end
