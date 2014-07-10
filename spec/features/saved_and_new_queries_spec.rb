require 'rails_helper'


feature 'user can see list of recent queries', %Q(
  As a user,
  I can see recent searches
  So I don't have to waste my time by retyping

) do



  # Acceptance Criteria

  # * A link appears with the content of a past query
  # * * The link goes to a results page for a search
  # * A query that has never been performed will be stored in the database

  scenario 'a link appears with the content of a past query' do
    FactoryGirl.create(:query, content: "Happy Gilmore")

    visit root_path

    expect(page).to have_content("Happy Gilmore")
  end

  scenario 'the link goes to a results page for a search' do
    results = JSON.parse(File.read(Rails.root.join("spec/data/movie_search_results.json")))
    MoviesApi.stub(:movies_search).and_return(results)
    FactoryGirl.create(:query, content: "Happy Gilmore")
    FactoryGirl.create(:query, content: "Forrest Gump")

    visit root_path

    expect(page).to have_content("Happy Gilmore")
    click_on 'Forrest Gump'
    expect(page).to have_content("Forrest Gump")
    expect(page).to have_content("1994")
  end

  scenario 'A query that has never been performed will be stored in the database' do
    previous_count = Query.count
    results = JSON.parse(File.read(Rails.root.join("spec/data/movie_blank_results.json")))
    MoviesApi.stub(:movies_search).and_return(results)

    visit root_path

    fill_in 'Search', with: "Forrest Gump"
    click_on 'Find Films'


    expect(Query.count).to eq(previous_count + 1)
  end

end
