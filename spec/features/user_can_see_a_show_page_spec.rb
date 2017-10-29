require 'rails_helper'
describe "As a logged in User" do
  scenario "I will see a welcome page with links to favorites and gifs" do

    user= User.create(username: "testing", email: "testing@gmail.com", password: "pass", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user.id)

    expect(page).to have_content("Welcome #{user.username}")

  end

end
