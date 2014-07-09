class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user_id, presence: true
  validates :movie_id, presence: true
  validates :rotten_tomatoes_id, presence: true
end
