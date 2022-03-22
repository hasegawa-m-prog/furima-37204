FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials(number: 2)}
    email                  {Faker::Internet.free_email}
    password               { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation  {password}
    name_sei               {'山田'}
    name_mei               {'太郎'}
    kana_sei               {'ヤマダ'}
    kana_mei               {'タロウ'}
    birthday               {'1977-01-06'}
  end
end