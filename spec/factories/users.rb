FactoryBot.define do
    factory :user do
      nickname               {'test'}
      email                  {Faker::Internet.email}
      password               {'a123456'}
      password_confirmation  {password}
      family_name            {"大塚"}
      first_name             {"大樹"}
      family_name_kana       {"オオツカ"}
      first_name_kana        {"ダイキ"}
      birthday               {Faker::Date.birthday}
    end
  end