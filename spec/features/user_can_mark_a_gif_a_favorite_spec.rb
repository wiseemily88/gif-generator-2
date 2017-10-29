require 'rails_helper'
describe "a user can favorite a gif" do
  scenario "a user is able to click on favorite button for a gif from the index page" do
    user= User.create(username: "admin", password: "pass", email: "admin@gmail.com", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    attributes = attributes_for(:category)
    category_1 = Category.create!(name: "Monday")
    category_2 = Category.create!(name: "Puppy")

    gif_1 = category_1.gifs.create!(image_path: "http://gph.is/2xMJrRb")
    gif_2 = category_1.gifs.create!(image_path: "http://gph.is/1L8sDoZ")
    gif_3 = category_1.gifs.create!(image_path: "http://gph.is/1PFOSyk")
    gif_4 = category_2.gifs.create!(image_path: "http://gph.is/29dwQaU")

    visit user_gifs_path(user)
    save_and_open_page

    first(:button, 'Favorite' ).click

    expect(current_path).to eq(user_favorite_gifs_path(user))

  end
end
