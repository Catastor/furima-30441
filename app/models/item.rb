class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :name
    validates :info
    validates :image
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :status_id, numericality: { other_than: 1, message: 'Select' }
    validates :delivery_charge_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipment_source_id, numericality: { other_than: 1, message: 'Select' }
    validates :date_of_shipment_id, numericality: { other_than: 1, message: 'Select' }
  end

  belongs_to :user
  has_one    :buyer
  # has_one    :order
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :date_of_shipment
end
