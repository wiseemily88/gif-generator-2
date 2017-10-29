require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end


describe User do
  describe "user roles" do
    it "they can be created as a default user" do
      user = User.create(username: "emily",
                        email: "emily@gmail.com",
                         password: "password",
                         role: 0
                        )

      expect(user).to be_valid
      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end

    it "they can be created as an admin" do
      user = User.create(username: "emily",
                        email: "emily@gmail.com",
                         password: "password",
                         role: 1
                        )
      expect(user).to be_valid
      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it "they are created as default user by default" do
      user = User.create(username: "emily",
                        email: "emily@gmail.com",
                         password: "password"
                        )
      expect(user).to be_valid
      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy

    end

  end
end
