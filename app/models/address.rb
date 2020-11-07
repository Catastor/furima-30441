class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buyer, dependent: :destroy
  belongs_to_active_hash :shipment_source

  validates :postal_code, :municipalities, :house_number, :phone_number, presence: true
  validates :shipment_source_id, numericality: { other_than: 1 }
  validate :building
end
