FactoryBot.define do
  factory :item do
    items_name             { 'hoge' }
    items_description      { Faker::Lorem.sentence }
    category_id            { 2 }
    condition_id           { 2 }
    shipping_fee_id        { 2 }
    shipping_region_id     { 2 }
    shipping_time_id       { 2 }
    items_price            { '9999' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/bike.jpeg'), filename: 'bike.jpeg')
    end
  end
end
