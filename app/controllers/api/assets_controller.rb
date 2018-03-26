class Api::AssetsController < ApplicationController

  def index
    user = User.find_by(username: asset_params[:username])
    if user
      assets = user.assets
      user_asset_shares = assets.map { |asset| asset.user_asset_shares(user.id) }

      render json: { assets: assets , user_asset_shares: user_asset_shares }
    else
      render json: { errors: { message: "User not found" } }
    end
  end

  def create
    user = User.find_by(username: asset_params[:username])
    if user
      if asset = Asset.find_by(symbol: asset_params[:symbol].upcase)
        user.association(:assets).send(:build_through_record, asset)
      else
        user.assets.build(symbol: asset_params[:symbol].upcase, uuid: asset_params[:uuid])
      end

      if user.save
        render json: asset
      else
        render json: { errors: { message: "#{user.user_assets.last.errors.full_messages.first}" } }
        user.user_assets.last.destroy
      end

    else
      render json: { errors: { message: "This Asset Failed To Save" } }
    end
  end

  def update
    user = User.find_by(username: asset_params[:username])
    if asset = user.assets.find_by(uuid: asset_params[:uuid])
      asset.symbol = asset_params[:symbol].upcase
      if asset.save
        render json: { success: { message: "Asset updated to #{asset.symbol}" } }
      else
        render json: { errors: { message: "Asset update Failed" } }
      end
    else
      render json: { errors: { message: "Asset not Found" } }
    end
  end

  def destroy
    user = User.find_by(username: asset_params[:username])
    symbol = asset_params[:uuid]
    if user
      if asset = user.assets.find_by(uuid: asset_params[:uuid])
        UserAsset.where(asset_id: asset.id, user_id: user.id).destroy_all
        Asset.destroy(asset.id)
        render json: {success: { message: "Symbol #{symbol} for #{user.username} deleted" }}
      else
        render json: {errors: { message: "Asset not found" }}
      end
    end
  end

  private

  def asset_params
    params.require(:asset).permit(:symbol, :username, :uuid, :shares)
  end

end
