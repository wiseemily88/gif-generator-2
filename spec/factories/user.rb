FactoryBot.define do
  factory :user do
    username Faker::Name.name
    email Faker::Internet.email
    sequence :password {|n| "#{nnn}"}
  end
end
