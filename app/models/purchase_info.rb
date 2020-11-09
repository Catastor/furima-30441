class PurchaseInfo
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_source_id, :municipalities, :house_number, :building, :phone_number, :token, :item_id, :user_id, :buyer_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :municipalities
    validates :house_number
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "Input only number" }
    validates :user_id
    validates :item_id
  end
  
  validates :shipment_source_id, numericality: { other_than: 1, message: 'Select' }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipment_source_id: shipment_source_id, municipalities: municipalities, house_number: house_number, building: building, phone_number: phone_number, buyer_id: buyer.id)
  end
end