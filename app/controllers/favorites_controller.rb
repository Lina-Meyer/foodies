class FavoritesController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @favorite = Favorite.new(restaurant: @restaurant, user: current_user)
    @favorite.save
    respond_to do |format|
      format.html { redirect_to restaurants_path }
      format.js # views/favorites/create.js.erb
    end
  end

  def destroy

  end
end
