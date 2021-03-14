FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { Faker::Name.initials(number: 2) }
    last_name             { Faker::Name.initials(number: 2) }
    kana_first_name       { Faker::Name.initials(number: 4) }
    kana_last_name        { Faker::Name.initials(number: 3) }
    birthday              { '1933-03-03' }
  end
end
