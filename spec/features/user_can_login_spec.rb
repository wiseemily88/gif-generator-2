
require 'rails_helper'
describe "user can log in" do
  scenario "user can log in" do
  user = User.create(username: "Ewise", email: "Ewise@gmail.com", password: "123")
  visit '/'

  click_on "Log In"


  expect(current_path).to eq(login_path)
  fill_in "session[username]", with: user.username
  fill_in "session[email]", with: user.email
  fill_in "session[password]", with: user.password

  click_on "Log In"


  expect(current_path).to eq(user_path(user))
  expect(page).to have_content ("Welcome #{user.username}")

  end
end
