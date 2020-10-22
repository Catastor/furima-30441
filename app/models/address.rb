class Address < ApplicationRecord
  belongs_to :buyer

  validates :postal_code, :municipalities, :house_number, :phone_number, presence: true
  validates :shipment_source_id, numericality: {other_than: 1}
end
