module SearchAndDisplayResult
  def search_and_display_result
    query = FactoryGirl.create(:query, content: "forrest")
    results = JSON.parse(File.read(Rails.root.join("spec/data/movie_search_results.json")))
    MoviesApi.stub(:movies_search).and_return(results)
    visit root_path
    fill_in 'Search', with: query.content
    click_button 'Find Films'
  end
end
