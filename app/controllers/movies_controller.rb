class MoviesController < ApplicationController
  def index
    if params[:search].empty?
      flash[:notice] = "Error - Empty Search"
      render :'welcome/index'
    else
      movies = MoviesApi.new.movies_search(params[:search])
      @movies = movies['movies']

    end

  end
end




