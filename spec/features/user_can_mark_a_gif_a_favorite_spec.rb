require 'rails_helper'
describe "a user can favorite a gif" do
  scenario "a user is able to click on favorite button for a gif from the index page" do
    admin_user= User.create(username: "admin", password: "pass", email: "admin@gmail.com", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
    attributes = attributes_for(:category)

    visit user_gifs_path(admin_user)


    click_button  "favorite"

    expect(current_path).to eq(user_favorite_gifs_path(admin_user))

  end
end
