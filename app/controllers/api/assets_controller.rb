class Api::AssetsController < ApplicationController

  def index
    @assets = Asset.all
    render json: @assets
  end

  def create
    user = User.find_by(username: asset_params[:username])
    if user
      if asset = user.assets.build(symbol: asset_params[:symbol].upcase)
        if user.save
          render json: asset
        else
          render json: { errors: { message: "This Asset Alredy Added" } }
        end
      else
        render json: { errors: { message: "This Asset Failed To Save" } }
      end
    end
  end

  private

  def asset_params
    params.require(:asset).permit(:symbol, :username)
  end

end
