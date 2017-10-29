require 'rails_helper'
describe "As an admin" do
  it "can see a list of all current categories" do

    admin_user= User.create(username: "admin", password: "pass", email: "admin@gmail.com", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
    category_1 = Category.create(name: "Monday")
    category_2 = Category.create(name: "Puppies")
    category_3 = Category.create(name: "Birthday")
    category_4 = Category.create(name: "Happy")

    visit admin_categories_path

    expect(page).to have_content("Monday")
    expect(page).to have_content("Puppies")
    expect(page).to have_content("Birthday")
    expect(page).to have_content("Happy")
  end

  it "can click on a link to add a new category" do

    visit admin_categories_path

    click_link "Add a New Category"


    expect(current_path).to eq(new_admin_category_path)
  end

end
