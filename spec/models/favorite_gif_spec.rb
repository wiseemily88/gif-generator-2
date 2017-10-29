require 'rails_helper'

RSpec.describe FavoriteGif, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a user and a gif id" do
        user = User.create(username: "Emily", email: "Emily@gmail.com", password: "123")

        favorite_gif= user.favorite_gifs.new

        expect(favorite_gif).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content" do
        user = User.create(username: "Emily", email: "Emily@gmail.com", password: "123")
        category = Category.create(name: "Monday")
        gif = Gif.create(image_path: "https://media2.giphy.com/media/gEtjpEXi4luLe/giphy.gif", category: category)
        favorite_gif= user.favorite_gifs.create(gif_id: gif.id)

        expect(favorite_gif).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to user" do
      user = User.create(username: "Emily", email: "Emily@gmail.com", password: "123")
      category = Category.create(name: "Monday")
      gif = Gif.create(image_path: "https://media2.giphy.com/media/gEtjpEXi4luLe/giphy.gif", category: category)
      favorite_gif= user.favorite_gifs.create(gif_id: gif.id)
      expect(favorite_gif).to respond_to(:user)
    end

  it "belongs to gif" do
    user = User.create(username: "Emily", email: "Emily@gmail.com", password: "123")
    category = Category.create(name: "Monday")
    gif = Gif.create(image_path: "https://media2.giphy.com/media/gEtjpEXi4luLe/giphy.gif", category: category)
    favorite_gif= user.favorite_gifs.create(gif_id: gif.id)
    expect(favorite_gif).to respond_to(:gif)
    end
  end
end
