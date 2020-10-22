class Item < ApplicationRecord
  belongs_to :user
  has_many   :comments
  has_one    :buyer

  validates :name, :info, :price, presence: true
  validates  :category_id, :status_id, :delivery_charge_id, :shipment_source_id, :date_of_shipment, numericality: { other_than: 1 }
end