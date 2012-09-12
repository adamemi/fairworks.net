class ApplicationController < ActionController::Base
  protect_from_forgery

  # helper methods
  helper_method :current_user
  
  before_filter :authenticate_user!
  #before_filter :verify_root_exists!

  private

  def verify_root_exists!
    root = User.where(:username => 'root').first
    if root.nil?
      root = User.new
      root.username = 'root'
      root.full_name = "root"
      root.password, root.password_confirmation = "password"
      root.save!
    end
  end

  def authenticate_user!
    # if session is empty
    if session[:user_id].nil?
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= (User.find(session[:user_id]) if session[:user_id])
  end
end
