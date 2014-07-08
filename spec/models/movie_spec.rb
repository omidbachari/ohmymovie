require 'rails_helper'

describe Movie do
  #it { should have_many(:users) }
  it { should have_valid(:title).when("Monty Python and the Holy Grail", "Toy Story") }
  it { should_not have_valid(:title).when(nil, "") }

  it { should have_valid(:year).when(2000, 1995) }
  it { should_not have_valid(:year).when(nil, "") }

  it { should have_valid(:synopsis).when("Great movie!", "Must see film!") }
  it { should_not have_valid(:synopsis).when(nil, "") }

  describe '.search' do
    it 'returns matching results' do
      movie = FactoryGirl.create(:movie, title: 'Billy Madison')

      results = Movie.search('Billy Madison')

      expect(results).to_not be_empty
      expect(results.first.title).to include movie.title
    end

    it 'returns a no results message' do
      results = Movie.search('101 Dalmations')

      expect(results).to be_empty
    end
  end
end

