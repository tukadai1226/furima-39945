class CreateShoppingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_addresses do |t|
      t.string     :post_code,      null: false
      t.integer    :prefecture_id,  null: false
      t.string     :city,           null: false
      t.string     :address,        null: false
      t.string     :building_name
      t.string     :telephone,      null: false
      t.references :history,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
