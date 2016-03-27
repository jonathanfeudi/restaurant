class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      #redirect_to some place
    else
      #redirect_to another place
    end
  end

  def destroy
    session[:current_user_id] = nil
    #redirect_to yet another place
  end
end
