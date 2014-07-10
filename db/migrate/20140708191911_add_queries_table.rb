class AddQueriesTable < ActiveRecord::Migration
  def change
    create_table "queries" do |t|
      t.string :content, null: false
    end
  end
end
