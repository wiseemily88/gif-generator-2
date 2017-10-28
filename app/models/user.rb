class User < ApplicationRecord
  enum role: ["default", "admin"]

  validates :username,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }

  has_secure_password

  has_many :favorite_gifs
  has_many :gifs, through: :favorite_gifs
end
