class CreateFavoriteGifs < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_gifs do |t|
      t.references :user, foreign_key: true
      t.references :gif, foreign_key: true
    end
  end
end
