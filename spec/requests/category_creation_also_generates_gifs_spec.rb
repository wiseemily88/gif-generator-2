require 'rails_helper'
describe "Category creates a Gif" do

  it "post create" do
    VCR.use_cassette("admin_categories_and_gifs", :record => :new_episodes) do
      admin_user= User.create(username: "admin", password: "pass", email: "admin@gmail.com", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
      attributes = attributes_for(:category)
      expect {
        post admin_categories_path, params:{category: attributes}
      }.to change(Category, :count).by(1)
      .and change(Gif, :count).by(5)
    end
  end
end
