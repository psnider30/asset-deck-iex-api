class Api::AssetsController < ApplicationController

  def index
    @assets = Asset.all
    render json: @assets
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie
    else
      render json: { errors: { message: "This Asset Failed To Save" } }
    end
  end

  private
    def asset_params
      params.require(asset).permit(:symbol)
    end
end
