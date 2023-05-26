FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    nickname              {Faker::Name.initials(number: 2)}
    first_name            { '太郎' }
    family_name           { '山田'}
    first_name_kana       { 'タロウ' }
    family_name_kana      { 'ヤマダ' }
    birthday              { Faker::Date.backward }
  end
end