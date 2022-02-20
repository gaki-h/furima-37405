FactoryBot.define do
  factory :order_destination do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '渋谷区' }
    address { '神宮前1-1-1' }
    building_name { 'ケヤキビル' }
    phone_number {'00012345678'}
  end
end
