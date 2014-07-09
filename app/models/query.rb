class Query < ActiveRecord::Base
  validates :content, presence: true
end
