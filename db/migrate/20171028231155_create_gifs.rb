class CreateGifs < ActiveRecord::Migration[5.1]
  def change
    create_table :gifs do |t|
      t.text :image_path
      t.references :category, foreign_key: true
    end
  end
end
