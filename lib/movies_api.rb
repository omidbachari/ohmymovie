require 'dotenv-rails'

class MoviesApi
  include HTTParty

  base_uri 'http://api.rottentomatoes.com/api/public/v1.0'

  def initialize(key=ENV['ROTTEN_TOMATOES_API_KEY'])
    @key = key

    if @key.nil? || @key == ""
      raise 'No API key!'
    end
  end

  def movies_search(q)
    q = CGI::escape(q)
    self.class.get('/movies.json', { query: { apikey: @key, q: q}})
  end
end
