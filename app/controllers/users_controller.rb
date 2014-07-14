class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @queries = Query.limit(10).order("created_at DESC")
    @movies = Movie.all

    # if params[:search] && params[:search][:query]
    #   @movies = Movie.api_search(params[:search][:query])
    #   Query.remember_recent(params[:search][:query])
    # elsif params[:seach] && params[:search].empty?
    #   flash[:notice] = "You performed an empty search"
    # end

    @favorites = Favorite.where(user_id: current_user.id)
  end
end
