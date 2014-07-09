require 'rails_helper'

feature 'user searches for a film', %q(
  As a film buff
  I want to search for obscure films
  So that I can appear more knowledgeable than my colleagues
) do


  before :each do
    MoviesApi.any_instance.stub(:movies_search).and_return({ movies: [] })
  end
  # Acceptance Criteria:
  # * There should be a search field
  # * If there are matching results in the movies table,
  #  those results are displayed
  # * If there are no matches, "Not found" is displayed

  scenario 'user does a successful search' do
    FactoryGirl.create(:movie, title: 'Forrest Gump')

    visit root_path
    fill_in 'Search', with: "Forrest Gump"
    click_on 'Find Films'

    expect(page).to have_content("Forrest Gump")
  end
  scenario 'user does an unsuccessful search' do
    visit root_path
    fill_in 'Search', with: "Happy Gilmore"
    click_on 'Find Films'

    expect(page).not_to have_content("Happy Gilmore")
    expect(page).to have_content("Not found")
  end

  scenario 'user does an empty search' do
    FactoryGirl.create(:movie, title: 'Forrest Gump')

    visit root_path
    fill_in 'Search', with: ""
    click_on 'Find Films'

    expect(page).to have_content("Error")
    expect(page).not_to have_content("Forrest Gump")
  end
end
