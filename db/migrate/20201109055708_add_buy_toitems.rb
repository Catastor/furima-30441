class AddBuyToitems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :buyed, :string
  end
end
