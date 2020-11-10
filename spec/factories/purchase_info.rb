FactoryBot.define do
  factory :purchase_info do
    user_id {1}
    item_id {1}
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-1234' }
    shipment_source_id { 2 }
    municipalities { '函館市' }
    house_number { '123' }
    building { '12' }
    phone_number { '12312341234' }
  end
end
