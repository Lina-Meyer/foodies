class UsersController < ApplicationController
  def show
    @user_show = User.find(params[:id])

    @friendships = current_user.friendships.select do |friendship|
      friendship.status == "pending"
    end
    @friends = []
    @friendships.each do |friendship|
      @friends << friendship.friend
    end
  end

  def edit
    @user = User.find(params[:id])
  end
end
