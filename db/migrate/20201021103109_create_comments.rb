class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.timestamps
      t.text       :text, null: false
      t.references :user, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
    end
  end
end
