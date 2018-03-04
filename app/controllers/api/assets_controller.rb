class Api::AssetsController < ApplicationController

  def index
    @assets = Asset.all
    render json: @assets
  end

  def create
    @asset = Asset.new(asset_params)
    if @asset.save
      render json: @asset
    else
      render json: { errors: { message: "This Asset Failed To Save" } }
    end
  end

  private
    def asset_params
      params.require(asset).permit(:symbol)
    end
end
