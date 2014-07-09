class AddColumnMovies < ActiveRecord::Migration
  def change
    add_column :movies, :rotten_tomatoes_id, :integer, uniqueness: true
  end
end
