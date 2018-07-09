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
  end
end
