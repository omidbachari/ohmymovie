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

    FactoryGirl.create(:query, content: "Happy Gilmore")
    FactoryGirl.create(:query, content: "Billy Madison")

    visit root_path

    expect(page).to have_content("Billy Madison")
    click_on 'Happy Gilmore'
    expect(page).to have_content("Happy Gilmore")
    expect(page).to have_content("1996")
  end

  scenario 'A query that has never been performed will be stored in the database' do
    previous_count = Query.count

    visit root_path

    fill_in 'Search', with: "Forrest Gump"
    click_on 'Find Films'


    expect(Query.count).to eq(previous_count + 1)
  end

end
