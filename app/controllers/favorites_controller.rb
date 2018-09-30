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
    @favorite
    @restaurant = Restaurant.find(params[:restaurant_id])
    @favorite = Favorite.all.where(restaurant_id: @restaurant)
    @favorite.first.destroy
  end
end
