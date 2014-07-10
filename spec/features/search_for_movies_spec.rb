require 'rails_helper'

feature 'user searches for a film', %q(
  As a film buff
  I want to search for obscure films
  So that I can appear more knowledgeable than my colleagues
) do



  # Acceptance Criteria:
  # * There should be a search field
  # * If there are matching results in the movies table,
  #  those results are displayed
  # * If there are no matches, "Not found" is displayed

  scenario 'user does a successful search', focus: true do
    results = JSON.parse(File.read(Rails.root.join("spec/data/movie_search_results.json")))
    MoviesApi.stub(:movies_search).and_return(results)

    visit root_path
    fill_in 'Search', with: "forrest"
    click_on 'Find Films'

    expect(page).to have_content("Forrest Gump")
  end

  scenario 'user does an unsuccessful search' do
    results = JSON.parse(File.read(Rails.root.join("spec/data/movie_blank_results.json")))
    MoviesApi.stub(:movies_search).and_return(results)
    visit root_path
    fill_in 'Search', with: "asdfasdfa"
    click_on 'Find Films'

    expect(page).to have_content("Not found")
  end

  scenario 'user does an empty search' do
    results = JSON.parse(File.read(Rails.root.join("spec/data/movie_blank_results.json")))
    MoviesApi.stub(:movies_search).and_return(results)
    visit root_path
    fill_in 'Search', with: ""
    click_on 'Find Films'

    expect(page).to have_content("You performed an empty search")
  end
end
