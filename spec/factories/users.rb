FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    first_name            { 'ああ' }
    last_name             { 'いい' }
    kana_first_name       { 'アア' }
    kana_last_name        { 'イイ' }
    birthday              { '1933-03-03' }
  end
end
