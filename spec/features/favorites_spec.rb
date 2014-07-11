require 'rails_helper'


feature 'user can add movie to favorites when signed in', %Q(
  As a user,
  I can add a movie to favorites
  So I can keep track of my favorite movies

) do

# Acceptance Criteria

# User only sees button to favorite when logged in
# Button adds movie to favorites, redirects user to user index

  scenario 'favorite button does not appear for logged in user' do
    search_and_display_result

    expect(page).to_not have_content('Favorite')
  end

  scenario 'favorite button appears for logged in user' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    search_and_display_result

    first('.button_to').click_button('Favorite')
    expect(page).to have_content('Favorites Page')
    expect(page).to have_content('Forrest Gump')
  end
end
