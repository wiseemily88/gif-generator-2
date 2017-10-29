class FavoriteGif < ApplicationRecord
  belongs_to :user
  belongs_to :gif

  scope :ordered, -> { includes(:categories).order('categories.name') }

end
