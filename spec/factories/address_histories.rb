FactoryBot.define do
  factory :address_history do
    post_code            {'123-4567'}
    city                 { '東京都' }
    address              { '港区' }
    building_name        { 'ハイツ'}
    telephone            { '00000000000' }
    token                {"tok_abcdefghijk00000000000000000"}
    prefecture_id        { 2 }

  end
end
