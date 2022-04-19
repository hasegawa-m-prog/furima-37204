FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    product                {Faker::Lorem.sentence}
    explanation            {Faker::Lorem.sentence}
    category_id            {Faker::Number.between(from: 02, to: 03)}
    status_id              {Faker::Number.between(from: 02, to: 03)}
    postage_id             {Faker::Number.between(from: 02, to: 02)}
    prefecture_id          {Faker::Number.between(from: 02, to: 03)}
    delivery_day_id        {Faker::Number.between(from: 02, to: 03)}
    price                  {Faker::Number.between(from: 300, to: 9999999)}

    association :user
  end
end