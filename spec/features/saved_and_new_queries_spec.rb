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
    results = {"total"=>5,
    "movies"=>
    [{"id"=>"10036",
    "title"=>"Forrest Gump",
    "year"=>1994,
    "mpaa_rating"=>"PG-13",
    "runtime"=>142,
    "critics_consensus"=>"",
    "release_dates"=>{"theater"=>"1994-07-06", "dvd"=>"2001-08-28"},
    "ratings"=>{"critics_rating"=>"Fresh", "critics_score"=>72, "audience_rating"=>"Upright", "audience_score"=>95},
    "synopsis"=>"",
    "posters"=>
    {"thumbnail"=>"http://content7.flixster.com/movie/11/17/36/11173677_tmb.jpg",
    "profile"=>"http://content7.flixster.com/movie/11/17/36/11173677_tmb.jpg",
    "detailed"=>"http://content7.flixster.com/movie/11/17/36/11173677_tmb.jpg",
    "original"=>"http://content7.flixster.com/movie/11/17/36/11173677_tmb.jpg"},
    "abridged_cast"=>
    [{"name"=>"Tom Hanks", "id"=>"162655641", "characters"=>["Forrest Gump"]},
    {"name"=>"Robin Wright", "id"=>"162659319", "characters"=>["Jenny Curran"]},
    {"name"=>"Gary Sinise", "id"=>"162659320", "characters"=>["Lt. Dan Taylor"]},
    {"name"=>"Mykelti Williamson", "id"=>"364627785", "characters"=>["Bubba Blue"]},
    {"name"=>"Sally Field", "id"=>"162656044", "characters"=>["Mrs. Gump"]}],
    "alternate_ids"=>{"imdb"=>"0109830"},
    "links"=>
    {"self"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/10036.json",
    "alternate"=>"http://www.rottentomatoes.com/m/forrest_gump/",
    "cast"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/10036/cast.json",
    "reviews"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/10036/reviews.json",
    "similar"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/10036/similar.json"}},
    {"id"=>"10509",
    "title"=>"Finding Forrester",
    "year"=>2000,
    "mpaa_rating"=>"PG-13",
    "runtime"=>136,
    "critics_consensus"=>"",
    "release_dates"=>{"theater"=>"2000-12-20", "dvd"=>"2001-04-24"},
    "ratings"=>{"critics_rating"=>"Certified Fresh", "critics_score"=>73, "audience_rating"=>"Upright", "audience_score"=>79},
    "synopsis"=>"",
    "posters"=>
    {"thumbnail"=>"http://content7.flixster.com/movie/25/61/256105_tmb.jpg",
    "profile"=>"http://content7.flixster.com/movie/25/61/256105_tmb.jpg",
    "detailed"=>"http://content7.flixster.com/movie/25/61/256105_tmb.jpg",
    "original"=>"http://content7.flixster.com/movie/25/61/256105_tmb.jpg"},
    "abridged_cast"=>
    [{"name"=>"Sean Connery", "id"=>"162656350", "characters"=>["William Forrester"]},
    {"name"=>"Rob Brown (VI)", "id"=>"162664265", "characters"=>["Jamal Wallace"]},
    {"name"=>"F Murray Abraham", "id"=>"377006663", "characters"=>["Professor Crawford"]},
    {"name"=>"Anna Paquin", "id"=>"162664300", "characters"=>["Claire"]},
    {"name"=>"Busta Rhymes", "id"=>"162686738", "characters"=>["Terrell"]}],
    "alternate_ids"=>{"imdb"=>"0181536"},
    "links"=>
    {"self"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/10509.json",
    "alternate"=>"http://www.rottentomatoes.com/m/finding_forrester/",
    "cast"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/10509/cast.json",
    "reviews"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/10509/reviews.json",
    "similar"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/10509/similar.json"}},
    {"id"=>"770805316",
    "title"=>"Famous Monster: Forrest J Ackerman",
    "year"=>2007,
    "mpaa_rating"=>"Unrated",
    "runtime"=>48,
    "release_dates"=>{},
    "ratings"=>{"critics_score"=>-1, "audience_score"=>100},
    "synopsis"=>"",
    "posters"=>
    {"thumbnail"=>"http://images.rottentomatoescdn.com/images/redesign/poster_default_thumb.gif",
    "profile"=>"http://images.rottentomatoescdn.com/images/redesign/poster_default_thumb.gif",
    "detailed"=>"http://images.rottentomatoescdn.com/images/redesign/poster_default_thumb.gif",
    "original"=>"http://images.rottentomatoescdn.com/images/redesign/poster_default_thumb.gif"},
    "abridged_cast"=>[{"name"=>"Forrest J Ackerman", "id"=>"770674591"}, {"name"=>"Ray Bradbury", "id"=>"364662227"}, {"name"=>"Bobbie Bresee", "id"=>"770742987"}],
    "links"=>
    {"self"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/770805316.json",
    "alternate"=>"http://www.rottentomatoes.com/m/famous-monster-forrest-j-ackerman/",
    "cast"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/770805316/cast.json",
    "reviews"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/770805316/reviews.json",
    "similar"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/770805316/similar.json"}},
    {"id"=>"770912883",
    "title"=>"Through the Eyes of Forrest Gump",
    "year"=>1994,
    "mpaa_rating"=>"Unrated",
    "runtime"=>37,
    "release_dates"=>{"dvd"=>"1995-04-28"},
    "ratings"=>{"critics_score"=>-1, "audience_rating"=>"Upright", "audience_score"=>93},
    "synopsis"=>"",
    "posters"=>
    {"thumbnail"=>"http://images.rottentomatoescdn.com/images/redesign/poster_default_thumb.gif",
    "profile"=>"http://images.rottentomatoescdn.com/images/redesign/poster_default_thumb.gif",
    "detailed"=>"http://images.rottentomatoescdn.com/images/redesign/poster_default_thumb.gif",
    "original"=>"http://images.rottentomatoescdn.com/images/redesign/poster_default_thumb.gif"},
    "abridged_cast"=>[{"name"=>"Tom Hanks", "id"=>"162655641"}],
    "links"=>
    {"self"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/770912883.json",
    "alternate"=>"http://www.rottentomatoes.com/m/through_the_eyes_of_forrest_gump/",
    "cast"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/770912883/cast.json",
    "reviews"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/770912883/reviews.json",
    "similar"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/770912883/similar.json"}},
    {"id"=>"770925116",
    "title"=>"Situation Critical: The U.S.S. Forrestal",
    "year"=>1997,
    "mpaa_rating"=>"Unrated",
    "runtime"=>50,
    "release_dates"=>{"dvd"=>"1997-11-25"},
    "ratings"=>{"critics_score"=>-1, "audience_score"=>0},
    "synopsis"=>"",
    "posters"=>
    {"thumbnail"=>"http://content7.flixster.com/movie/10/97/72/10977237_tmb.jpg",
    "profile"=>"http://content7.flixster.com/movie/10/97/72/10977237_tmb.jpg",
    "detailed"=>"http://content7.flixster.com/movie/10/97/72/10977237_tmb.jpg",
    "original"=>"http://content7.flixster.com/movie/10/97/72/10977237_tmb.jpg"},
    "abridged_cast"=>[],
    "links"=>
    {"self"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/770925116.json",
    "alternate"=>"http://www.rottentomatoes.com/m/situation_critical_the_uss_forrestal/",
    "cast"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/770925116/cast.json",
    "reviews"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/770925116/reviews.json",
    "similar"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/770925116/similar.json"}}],
    "links"=>{"self"=>"http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=Forrest&page_limit=30&page=1"},
    "link_template"=>"http://api.rottentomatoes.com/api/public/v1.0/movies.json?q={search-term}&page_limit={results-per-page}&page={page-number}"}
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
    MoviesApi.stub(:movies_search).and_return({"total"=>0,
    "movies"=>[],
    "links"=>{"self"=>"http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=asdfasdfa&page_limit=30&page=1"},
    "link_template"=>
    "http://api.rottentomatoes.com/api/public/v1.0/movies.json?q={search-term}&page_limit={results-per-page}&page={page-number}"})
    visit root_path

    fill_in 'Search', with: "Forrest Gump"
    click_on 'Find Films'


    expect(Query.count).to eq(previous_count + 1)
  end

end
