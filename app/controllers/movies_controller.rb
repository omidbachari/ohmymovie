class MoviesController < ApplicationController
  def index
    @movies = []
    if params[:search]
      @movies = Movie.search(params[:search])
    end
  end
end
