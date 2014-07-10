class MoviesApi

  include HTTParty

  base_uri 'http://api.rottentomatoes.com/api/public/v1.0'

  def self.movies_search(query)
    JSON.parse(get('/movies.json', {
      query: { apikey: ENV["ROTTEN_TOMATOES_API_KEY"], q: CGI::escape(query)}
    }))
  end
end
