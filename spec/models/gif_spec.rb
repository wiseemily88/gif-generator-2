require 'rails_helper'

RSpec.describe Gif, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a image_path " do
        category = Category.create(name: "Monday")
        gif = Gif.create(category: category)

        expect(gif).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content" do
        category = Category.create(name: "Monday")
        gif = Gif.create(image_path: "https://media2.giphy.com/media/gEtjpEXi4luLe/giphy.gif", category: category)

        expect(gif).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to category" do
      category = Category.create(name: "Monday")
      gif = Gif.create(image_path: "https://media2.giphy.com/media/gEtjpEXi4luLe/giphy.gif", category: category)
      expect(gif).to respond_to(:category)
    end
  end  
end
