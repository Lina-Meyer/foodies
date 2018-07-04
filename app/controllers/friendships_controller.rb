class FriendshipsController < ApplicationController
  def new
    if params[:query].present?
      sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @users = nil
    end
  end

  def create
  end
end
