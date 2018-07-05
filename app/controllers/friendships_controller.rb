class FriendshipsController < ApplicationController
  def new
    @all = Friendship.all
    if params[:query].present?
      sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
      @users = User.where(sql_query, query: "%#{params[:query]}%")

      @friends = []
      current_user.friendships.each do |friendship|
        @friends << friendship.friend_id
      end


      @new_users1 = @users.select do |user|
        @friends.include?(user.id) == false
      end

      @new_users = @new_users1.select do |user|
        user.id != current_user.id
      end

      # @users.each do |user|
      #   @new_friendships = user.friendships.select do |friendship|
      #     friendship.friend_id =f= current_user.id
      #     raise
      #   end
      # end

      # @new_users = @users.select do |user|
      #   @all.include?(user) == false
      # end
    else
      @users = nil
    end
  end

  def create
    # eine Seite der Freunschaft
    @friendship = Friendship.new
    @friendship.user_id = current_user.id
    @friend = User.find(params[:user_id])
    @friendship.friend_id = @friend.id
    @friendship.save
    # andere Seite der Freunschaft
    @friendship_second = Friendship.new
    @friendship_second.friend_id = current_user.id
    @user = User.find(params[:user_id])
    @friendship_second.user_id = @user.id
    @friendship_second.save
  end

  private

  def friendship_params
     params.require(:friendship).permit(:status)
  end
end
