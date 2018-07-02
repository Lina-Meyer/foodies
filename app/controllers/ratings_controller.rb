class RatingsController < ApplicationController

  def new
    @rating = Rating.new
    @restaurant = Restaurant.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.restaurant = Restaurant.last
    @rating.user = current_user
    if @rating.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:header, :description, :atmosphere, :stars, {photos: []})
  end

end

