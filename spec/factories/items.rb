FactoryBot.define do
  factory :item do  
    product_name   { 'ああああ' }
    explanation    { 'イイイイ' }
    category_id    { 2 }
    state_id       { 2 }
    delivery_id    { 2 }
    region_id      { 2 }
    day_id         { 2 }
    price          { 300 }
    association :user
    after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
