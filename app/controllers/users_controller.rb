class UsersController < ApplicationController
  def show
    @user_show = User.find(params[:id])

    @friendships = current_user.friendships.select do |friendship|
      friendship.status == "pending"
    end
    @friendships_two = @friendships.select do |friendship|
      friendship.action != 'yes'
    end
    @friends = []
    @friendships_two.each do |friendship|
      @friends << friendship.friend
    end

    @friendships_bestätigt = @user_show.friendships.select do |friendship|
      friendship.status = 'accepted'
    end

    @friends_bestätigt = @friendships_bestätigt.each do |friendship|
      friendship.friend
    end
  end

  def edit
    @user = User.find(params[:id])
  end
end
