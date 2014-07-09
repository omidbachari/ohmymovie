require 'rails_helper'


feature 'user can see list of recent queries', %Q(
  As a user,
  I can see recent searches
  So I don't have to waste my time by reinventing the wheel

) do

  before :each do
    MoviesApi.any_instance.stub(:movies_search).and_return({ movies: [] })
  end

  # Acceptance Criteria

  # * Past query results are pulled from the database
  # * * The results from the database are the same as the results from the API search
  # * For new queries, the results will come from the rotten tomatoes api
  # * * The results will be stored in the database

  # scenario 'results are pulled from the database when come from past query' do
  # end

  # scenario 'results from the database are the same as the results from the API search' do
  # end

  # scenario 'for new queries, movie results will come from the rotten tomatoes api' do
  # end

  # scenario 'movie results will be stored in the database' do
  # end
end
