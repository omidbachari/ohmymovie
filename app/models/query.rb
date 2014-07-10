class Query < ActiveRecord::Base
  validates :content, presence: true

  def self.remember_recent(query)
    self.create(content: query)
  end
end
