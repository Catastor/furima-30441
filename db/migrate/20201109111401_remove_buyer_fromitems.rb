class RemoveBuyerFromitems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :buyed, :string
  end
end
