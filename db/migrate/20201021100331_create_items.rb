class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.timestamps
      t.string :name,                 null: false
      t.text :info,                   null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :price,               null: false
      t.integer :delivery_id,         null: false
      t.integer :shipment_source_id,  null: false
      t.integer :date_of_shipment_id, null: false
      t.references :user,             foregin_key: true, null: false
    end
  end
end
