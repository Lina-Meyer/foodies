class FriendshipsController < ApplicationController
  def new
    @all = Friendship.all
    if params[:query].present?
      sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
      @users = User.where(sql_query, query: "%#{params[:query]}%")
      raise
    else
      @users = nil
    end
  end

  def create
    @friendship = Friendship.new
    @friendship.user_id = current_user.id
    @friend = User.find(params[:user_id])
    @friendship.friend_id = @friend.id
    @friendship.save
  end

  private

  def friendship_params
     params.require(:friendship).permit(:status)
  end
end
