class Category < ApplicationRecord
  has_many :gifs

  validates :name, presence: true
end
