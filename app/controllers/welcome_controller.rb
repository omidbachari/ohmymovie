class WelcomeController < ApplicationController
  def index
    @queries = Query.limit(10)
  end
end
