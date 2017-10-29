require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        category = Category.new()
        expect(category).to be_invalid
      end


      it "has a unique name" do
          category_1 = Category.create(name: "Monday")
          category_2 = Category.new(name: "Monday")
        expect(category_2).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        category_1 = Category.new(name: "Monday")
        expect(category_1).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many gifs" do
      category_1 = Category.new(name: "Monday")
      expect(category_1).to respond_to(:gifs)
    end
  end


end
