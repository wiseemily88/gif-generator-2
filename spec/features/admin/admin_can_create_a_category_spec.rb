require 'rails_helper'
describe "As an admin" do
  it "can create a new category" do

    admin_user= User.create(username: "admin", password: "pass", email: "admin@gmail.com", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

    visit new_admin_category_path


    fill_in "category[name]", with: "Monday"

    click_button "Generate a New GIF"

    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content("Monday")
  end
end
