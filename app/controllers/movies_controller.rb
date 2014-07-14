class MoviesController < ApplicationController
  def index
    @queries = Query.limit(10).order("created_at DESC")
    @movies = Movie.all
    if params[:search] && !params[:search].empty?
      @movies = Movie.api_search(params[:search])
      Query.remember_recent(params[:search])
    else
      flash[:notice] = "You performed an empty search"
    end
  end
  def create
    @movie_record = Movie.find_or_initialize_by(movie_params) do |movie|
      movie.title = params[:title]
      movie.year = params[:year]
      if params[:synopsis].empty?
        movie.synopsis = "NA"
      else
        movie.synopsis = params[:synopsis]
      end
      movie.rotten_tomatoes_id = params[:rotten_tomatoes_id]
    end
    @movie_record.save

    @favorite = Favorite.new(movie_id: @movie_record.id, user_id: current_user.id)
    if @favorite.save
      flash[:notice] = 'You successfully added a favorite movie!'
      redirect_to users_path
    else
      flash[:notice] = 'Something went wrong.'
      @queries = Query.limit(10).order("created_at DESC")
      redirect_to :back

    end
  end

private

def movie_params
  params.permit(:rotten_tomatoes_id)
end

end
