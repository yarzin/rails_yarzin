FactoryGirl.define do
  factory :product do
    name { Faker::Hipster.word}
    description { Faker::Hipster.sentence}
    price { Faker::Commerce.price}
  end
end