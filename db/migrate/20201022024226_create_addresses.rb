class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.timestamps
      t.string  :postal_code,        null: false
      t.integer :shipment_source_id, null: false
      t.string  :municipalities,     null: false
      t.string  :house_number,       null: false
      t.string  :building
      t.string  :phone_number,       null: false
      t.references :buyer,           foreign_key: true, null: false
    end
  end
end
