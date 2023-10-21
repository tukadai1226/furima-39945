FactoryBot.define do
  factory :item do
    item                       { Faker::Name.initials(number: 2) }
    explanation                { Faker::Lorem.sentence }
    price                      { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id                { Faker::Number.between(from: 2, to: 11) }
    condition_id               { Faker::Number.between(from: 2, to: 7) }
    burden_id                  { Faker::Number.between(from: 2, to: 3) }
    prefecture_id              { Faker::Number.between(from: 2, to: 48) }
    estimated_shopping_date_id { Faker::Number.between(from: 2, to: 4) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-image.png'), filename: 'test_image.png')
    end
  end
end
