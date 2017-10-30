class Gif < ApplicationRecord
  belongs_to :category
  has_many :favorite_gifs,  :dependent => :destroy
  has_many :users, through: :favorite_gifs
  validates :image_path, presence: true
end
