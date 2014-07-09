require 'rails_helper'

feature 'api search', %q(
  As a moive fan
  I want to search the Rotten Tomatoes API for movies
  So that I know about all the films
) do

  scenario 'movie search fails, hits api' do
    visit root_path
    fill_in 'Search', with: 'Apollo 11'
    click_on 'Find Film'
    expect(page).to have_content("Apollo 11")
  end
end
