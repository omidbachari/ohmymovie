class ChangeColumnMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :synopsis
    add_column :movies, :synopsis, :text
  end
end
