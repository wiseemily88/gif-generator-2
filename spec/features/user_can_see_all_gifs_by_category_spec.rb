require 'rails_helper'


describe "user sees a list of gifs sorted by category" do
  scenario "user sees a list of gifs on the index" do
    user= User.create(username: "testing", email: "testing@gmail.com", password: "pass", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    category_1 = Category.create!(name: "Monday")
    category_2 = Category.create!(name: "Puppy")

    gif_1 = category_1.gifs.create!(image_path: "http://gph.is/2xMJrRb")
    gif_2 = category_1.gifs.create!(image_path: "http://gph.is/1L8sDoZ")
    gif_3 = category_1.gifs.create!(image_path: "http://gph.is/1PFOSyk")
    gif_4 = category_2.gifs.create!(image_path: "http://gph.is/29dwQaU")


    visit user_gifs_path(user)
    expect(page).to have_css("#image_#{gif_1.id}")
  end

end
