class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.references :artist, index: true, foreign_key: true
      t.string :cover
      t.text :lyrics

      t.timestamps null: false
    end
  end
end
