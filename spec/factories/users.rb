FactoryBot.define do
  factory :user do
    last_name { '小野' }
    last_furigana { 'オノ' }
    first_name { '洋子' }
    first_furigana { 'ヨウコ' }
    nickname { 'youko' }
    birthday { '1990-05-01' }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password += "8q" }
    password_confirmation { password }
  end
end
