class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user, presence: true
  validates :movie, presence: true
  validates :movie, uniqueness: { scope: :user }
end
