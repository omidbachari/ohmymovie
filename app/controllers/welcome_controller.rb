class WelcomeController < ApplicationController
  def index
    @queries = Query.limit(10).order("created_at DESC")
  end
end
