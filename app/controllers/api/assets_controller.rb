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
          render json: { errors: { message: "#{user.user_assets.last.errors.messages[:asset_id][0]}" } }
        end
      else
        render json: { errors: { message: "This Asset Failed To Save" } }
      end
    end
  end

  def destroy
    user = User.find_by(username: asset_params[:username])
    symbol = asset_params[:symbol].upcase
    if user
      if asset = user.assets.find_by(symbol: symbol)
        asset.destroy
        render json: {success: { message: "Symbol #{symbol} for #{user.username} deleted" }}
      else
        render json: {errors: { message: "Asset not found" }}
      end
    end
  end

  private

  def asset_params
    params.require(:asset).permit(:symbol, :username)
  end

end
