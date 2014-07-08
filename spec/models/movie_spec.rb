require 'rails_helper'

describe Movie do
  #it { should have_many(:users) }
  it { should have_valid(:title).when("Monty Python and the Holy Grail", "Toy Story") }
  it { should_not have_valid(:title).when(nil, "") }

  it { should have_valid(:year).when(2000, 1995) }
  it { should_not have_valid(:year).when(nil, "") }

  it { should have_valid(:synopsis).when("Great movie!", "Must see film!") }
  it { should_not have_valid(:synopsis).when(nil, "") }
end
