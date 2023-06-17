FactoryBot.define do
  factory :order_shipping do
    zip_code { '123-4567' }
    shipping_region_id { 2 }
    shipping_city { '東京都' }
    shipping_street { '1-1' }
    shipping_building { '東京ハイツ' }
    phone { 12345678909 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
