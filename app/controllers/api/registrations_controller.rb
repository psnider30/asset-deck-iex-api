class Api::RegistrationsController < ApplicationController

  skip_before_action :authenticate

  def create
    user = User.new(auth_params)
    if user.save
      render json: user
    else
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:username, :email, :password, :password_confirmation)
  end

end
