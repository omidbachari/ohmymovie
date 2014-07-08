class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :year, presence: true
  validates :synopsis, presence: true

  def self.search(search)
    where("title ILIKE ?", "%#{search}%")
  end

end
