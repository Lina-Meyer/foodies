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

  def show
    @user_show = User.find(params[:user_id])
    @friendships_bestätigt = @user_show.friendships.select do |friendship|
      friendship.status = 'accepted'
    end

    @friends_bestätigt = []
    @friendships_bestätigt.each do |friendship|
      @friends_bestätigt << friendship.friend
    end
  end

  def create
    # eine Seite der Freunschaft
    @friendship = Friendship.new
    @friendship.user_id = current_user.id
    @friend = User.find(params[:user_id])
    @friendship.friend_id = @friend.id
    @friendship.action = "yes"
    @friendship.save
    # andere Seite der Freunschaft
    @friendship_second = Friendship.new
    @friendship_second.friend_id = current_user.id
    @user = User.find(params[:user_id])
    @friendship_second.user_id = @user.id
    @friendship_second.save
  end

  def edit
  end

  def update
    @user = User.find(params[:user_id])
    @friendship = @user.friendships.where(friend_id:current_user).first
    @friendship.status = 'accepted'
    @friendship_two = current_user.friendships.where(friend_id: @user.id).first
    @friendship_two.status = 'accepted'
    @friendship.save
    @friendship_two.save
  end

  private

  def friendship_params
     params.require(:friendship).permit(:status)
  end
end
