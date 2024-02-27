class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  #before_action :set_users

  def show
    @trips = Trip.where(user_id: @user.id)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

  #def set_users
    #@users = User.all
  #end
  
  def user_params
    params.require(:user).permit(:email, :nickname, :profile, :birthday, :image)
  end

end
