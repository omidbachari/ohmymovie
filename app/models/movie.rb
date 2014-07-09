class Movie < ActiveRecord::Base
  has_many :favorited_users, class_name: "User", through: :favorites
  has_many :favorites

  validates :title, presence: true
  validates :year, presence: true
  validates :synopsis, presence: true
  validates_uniqueness_of :rotten_tomatoes_id

  def self.search(search)
    where("title ILIKE ?", "%#{search}%")
  end



end
