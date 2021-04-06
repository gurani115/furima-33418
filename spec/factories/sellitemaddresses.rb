FactoryBot.define do
  factory :SellitemAddress do
    postal_code   { '123-4567' }
    region_id     { 2 }
    town          { 'あいうえお町' }
    numbering     { '青山1-1-1' }
    building      { '大ビル' }
    telephone     { '09055556666' }
    purchase_id   { 2 }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
