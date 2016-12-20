class UsersController < ApplicationController
before_action :require_login, except: [:create]
  before_action :require_correct_user, only: [:edit, :update]
  def create
  	@user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to "/events"
    else
      puts "error creating user"
      flash[:register_notice] = @user.errors.full_messages
      render '/sessions/index'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]).update(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], location: params[:user][:location], state: params[:user][:state])
    redirect_to "/events"
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
  end
end