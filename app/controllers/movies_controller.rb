class MoviesController < ApplicationController
  def index
    if params[:search] && !params[:search].empty?
      @movies = Movie.api_search(params[:search])
      Query.remember_recent(params[:search])
    else
      flash[:notice] = "You performed an empty search - So here are some of our user favorite movies"
      @movies = Movie.all
    end
  end
end
