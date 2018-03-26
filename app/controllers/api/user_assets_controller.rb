class Api::UserAssetsController < ApplicationController

  def update
    user = User.find_by(username: asset_params[:username])
    if user
      asset = Asset.find_by(uuid: asset_params[:uuid])
      user_asset = UserAsset.find_by(user_id: user.id, asset_id: asset.id)
      asset_params[:transaction] == 'buy' ? user_asset.add_share : user_asset.remove_share
      if user_asset.save
        render json: { symbol: asset.symbol, shares: user_asset.shares, uuid: asset_params[:uuid] }
      else
        render json:{ shares: 0, errors: { message: "Share Transaction Failed" } }
      end
    end
  end

  private

  def asset_params
    params.require(:asset).permit(:transaction, :username, :uuid)
  end
end
