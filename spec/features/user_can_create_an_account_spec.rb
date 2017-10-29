require 'rails_helper'
describe "guest becomes a new user" do
  it "user can create a new account" do

   visit '/'

   click_on "Create Account"

   expect(current_path).to eq(new_user_path)

   fill_in "user[username]", with: "EWise"
   fill_in "user[email]", with: "EWise@gmail.com"
   fill_in "user[password]", with: "123"
   click_on "Create User"


  expect(current_path).to eq(user_path(User.last))
  expect(page).to have_content("Welcome #{User.last.username}")

  expect(page).to have_link("Log Out")

  click_on "Log Out"
  expect(current_path).to eq(root_path)
  end


end
