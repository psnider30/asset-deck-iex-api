class Api::UserAssetsController < ApplicationController

  def create
  end

  def update
  end

  def destroy
  end

  private

  def asset_params
    params.require(:asset).permit(:shares, :username, :uuid)
  end
end
