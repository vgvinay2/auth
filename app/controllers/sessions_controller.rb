class SessionsController < ApplicationController
  def new
  end
  
  def home
    render :template => "/sessions/home"
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
     render :template => 'sessions/home', :notice => "Logged in!"
     # redirect_to sessions_home_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end
end
