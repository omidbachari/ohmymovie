class AddMoviesTable < ActiveRecord::Migration
  def change
    create_table "movies" do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.integer :synopsis, null: false
    end
  end
end
