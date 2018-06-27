class RestaurantsController < ApplicationController
  def home
  end

  def index
    @friendships = current_user.friendships
    @friends = []
    @friendships.each do |friendship|
      @friends << friendship.friend
    end
    @restaurants_list = []
    @friends.each do |friend|
      @restaurants_list << friend.restaurants
    end
    @restaurants_pure = []
    @restaurants_list.each do |restaurant|
      restaurant.each do |r|
        @restaurants_pure << r
      end
    end


    if params[:city].present?

      # @restaurants = @restaurants_pure(city: params[:city])
      @restaurants = @restaurants_pure.select do |restaurant|
          restaurant.city == params[:city]
      end
      # @restaurants = @restaurants_list.where(city: params[:city])
    else
      @restaurants = []
    end
  end
end
