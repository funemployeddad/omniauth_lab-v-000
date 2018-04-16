class SessionsController < ApplicationController

  def new
  end

  def create
    user = user.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to root_path
    else
      render 'sessions/new'
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
