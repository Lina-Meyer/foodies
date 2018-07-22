class RestaurantsController < ApplicationController
  def home
  end

  def index
    # @all = Friendship.all
    # @new_friendships = Friendship.all.select do |f|
    #   f.user_id == current_user.id or f.friend_id == current_user.id
    # end
    # @friends = []
    # @new_friendships.each do |friendship|
    #   if current_user.id == friendship.user_id
    #     @friends << friendship.friend
    #   else
    #     @friends << friendship.user
    #   end
    # end

    @friendships = current_user.friendships.where(status:'accepted')
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

    # @unique = @restaurants_pure.uniq{ |d| d[:name]}

# find all names of the restaurants to see which names are double
    @arr = []
    @restaurants_pure.each do |restaurant|
      @arr << restaurant.name
    end

# find all double names
    @doubles = @arr.find_all { |e| @arr.count(e) > 1 }.uniq

#find all restaurants that are not listed more than once
    @restaurants_ohne_doubles = []

    @restaurants_pure.each do |restaurant|
      if @doubles.exclude?(restaurant.name) == true
        @restaurants_ohne_doubles << restaurant
      end
    end

# list all restaurants that are duplicates
    @restaurants_doubles = []
    @restaurants_pure.each do |restaurant|
      if @doubles.exclude?(restaurant.name) == false
        @restaurants_doubles << restaurant
      end
    end


    if params[:city].present?

      # @restaurants = @restaurants_pure(city: params[:city])
      @restaurants_ohne = @restaurants_ohne_doubles.select do |restaurant|
        restaurant.city == params[:city]
      end
      # @restaurants = @restaurants_list.where(city: params[:city])
    else
      @restaurants_ohne = []
    end

    if params[:city].present?

      # @restaurants = @restaurants_pure(city: params[:city])
      @restaurants_mit = @restaurants_doubles.select do |restaurant|
        restaurant.city == params[:city]
      end
      # @restaurants = @restaurants_list.where(city: params[:city])
    else
      @restaurants_mit = []
    end
    @restaurants_mit = @restaurants_mit.group_by { |d| d[:name] }



    @restaurant_first = @restaurants_mit.first

    # @all_users = []
    # @restaurants_mit.each do |restaurant|
    #   @all_users << restaurant.users
    # end

    if params[:city].present?

      # @restaurants = @restaurants_pure(city: params[:city])
      @restaurants = @restaurants_doubles.select do |restaurant|
        restaurant.city == params[:city]
      end
      # @restaurants = @restaurants_list.where(city: params[:city])
    else
      @restaurants = []
    end

    #index map

    @restaurants_map = @restaurants.select do |restaurant|
      restaurant.latitude != nil && restaurant.longitude != nil
    end


    @markers = @restaurants_map.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end

    @average = average
  end

  def show
    @restaurant_show = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
    else
      render :new
    end

  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :zipcode, :country, :city)
  end

  def average
    sum = 0
    number = 0
    @restaurants.each do |restaurant|
      restaurant.ratings.each do |rating|
        number += 1
        sum += rating.stars
      end
    end
    @average = (sum.to_f/number.to_f).to_f.round(1)
    return @average
  end

end
