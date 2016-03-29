class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    redirect_to new_user_path unless session[:current_user_id]
  end

  def current_user
    User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def authenticate_admin
    redirect_to root_path unless
    User.where(id: (session[:current_user_id]))[0].admin == true
  end

  def authenticate_chef
    redirect_to root_path unless
    User.where(id: (session[:current_user_id]))[0].chef == true
  end

end
