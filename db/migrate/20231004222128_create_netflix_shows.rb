class CreateNetflixShows < ActiveRecord::Migration[7.0]
  def change
    create_table :netflix_shows, id: :uuid do |t|
      t.string :show_id
      t.string :genre
      t.string :title
      t.string :director
      t.string :cast
      t.string :country
      t.date :published_at
      t.integer :year
      t.string :rating
      t.string :duration
      t.string :listed_in
      t.text :description

      t.timestamps
    end
  end
end
