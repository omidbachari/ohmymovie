class CreateTableFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false
      t.integer :movie_id, null: false
    end
    add_index :favorites, [:user_id, :movie_id], unique: true
  end
end
