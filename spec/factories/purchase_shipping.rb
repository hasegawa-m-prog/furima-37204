FactoryBot.define do
  factory :purchases_shipping do
    
    postcode               {"333-3333"}
    prefecture_id          {Faker::Number.between(from: 2, to: 3)}
    municipality           {"浜田市"}
    address                {"309-11"}
    building               {"夕香の塔"}
    phone                  {"11111111111"}
    token                  {"tok_abcdefghijk00000000000000000"}
  end
end