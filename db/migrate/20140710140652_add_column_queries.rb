class AddColumnQueries < ActiveRecord::Migration
  def change
    add_column(:queries, :created_at, :datetime)
    add_column(:queries, :updated_at, :datetime)
  end
end
