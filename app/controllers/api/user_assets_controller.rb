class Api::UserAssetsController < ApplicationController

  def create
  end

  def update 
  end

  def destroy
  end

  private

  def asset_params
    params.require(:asset).permit(:symbol, :username, :uuid)
  end
end
