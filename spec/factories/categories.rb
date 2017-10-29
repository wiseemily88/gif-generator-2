FactoryBot.define do
  factory :category do
    sequence :name {|n| "category_name#{n}"}
  end
end
