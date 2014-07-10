class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user, presence: true
  validates :movie, presence: true
  validates :rotten_tomatoes_id, presence: true
end
