class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.integer :quantity
      t.integer :buy_price
      t.integer :sell_price
      t.string :stck_img
      t.integer :store_id
      t.integer :category_id
      t.integer :subcategory_id

      t.timestamps null: false
    end
  end
end
