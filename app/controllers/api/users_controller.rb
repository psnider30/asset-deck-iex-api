class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = user.new(user_params)
    if @user.save
      render json: @user
    else
      render json: { errors: { message: "This user Failed To Save" } }
    end
  end

  private
    def users_params
      params.require(user).permit(:username, :email, :password, :password_confirmation)
    end
end
