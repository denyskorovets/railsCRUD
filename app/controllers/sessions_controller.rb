class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:login_email])
    puts user.inspect
    if user && user.authenticate(params[:login_password])
      session[:user_id] = user.id
      redirect_to "/events"
    else
      flash[:login_notice] = ["Invalid combination"]
      render '/sessions/index'
    end
  end

  def destroy
    session.clear
    redirect_to '/sessions/index'
  end

  def index
  end

end