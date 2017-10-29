FactoryBot.define do
  factory :favorite_gifs, :parent => :user do
    classrooms {[FactoryGirl.create(:classroom)]}
end
end
