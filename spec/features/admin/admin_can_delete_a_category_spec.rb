require 'rails_helper'
describe "As an admin" do
  it "can delete a category" do

    admin_user= User.create(username: "admin", password: "pass", email: "admin@gmail.com", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
    category = Category.create(name: "Monday")

    visit admin_categories_path



    click_link "Delete"


    expect(current_path).to eq(admin_categories_path)
  end
end
