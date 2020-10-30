FactoryBot.define do
  factory :item do
    name { 'カリキュラム' }
    info { '時間割です' }
    category_id { '2' }
    status_id { '2' }
    delivery_charge_id { '2' }
    shipment_source_id { '2' }
    date_of_shipment_id { '2' }
    price { 500 }

    after(:build) do |f|
      f.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
