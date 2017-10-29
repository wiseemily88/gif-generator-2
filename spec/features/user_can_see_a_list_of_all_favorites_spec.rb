require 'rails_helper'
describe "As a logged in User" do
    scenario "I will see a page with all my favorite and gifs" do

  user= User.create(username: "testing", email: "testing@gmail.com", password: "pass", role: 0)
  category = Category.create(name: "Monday")

  gif = Gif.create(image_path: "testing", category: category)

  user.favorite_gifs.create( gif_id: gif.id)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit user_favorite_gifs_path(user.id)

  expect(page).to have_css("#image_#{user.gifs.first.id}")

  click_link "unfavorite"
  expect(current_path).to eq(user_favorite_gifs_path(user.id))

  end
end
