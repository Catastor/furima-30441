class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :info
    validates :image
    validates :price
  end

  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range'}

  validates :category_id, :status_id, :delivery_charge_id, :shipment_source_id, :date_of_shipment_id, numericality: { other_than: 1 , message: 'Select'}

  belongs_to :user
  has_many   :comments
  has_one    :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :date_of_shipment
end
