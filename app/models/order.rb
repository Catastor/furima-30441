class Order < ApplicationRecord
  belongs_to :item
  has_one :address
  has_one_attached :image

  attr_accessor :token
  validates :token, presence: true
end
