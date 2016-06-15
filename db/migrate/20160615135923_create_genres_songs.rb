class CreateGenresSongs < ActiveRecord::Migration
  def change
    create_table :genres_songs do |t|
      t.references :genre, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
