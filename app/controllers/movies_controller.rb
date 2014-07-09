# require 'movies_api'

class MoviesController < ApplicationController
  def index
    # @movies = []
    if params[:search]

      movies = MoviesApi.new.movies_search(params[:search])
      @movies = movies['movies']


    end
  end
end
    # @movies = []
    # if params[:search] == nil || params[:search] == ""
    #   flash[:notice] = "Error - Empty Search"
    #   render root_path
    # else
    #   # @movies = Movie.search(params[:search])
    #   @movies = movies_search(params[:search])
    # end
