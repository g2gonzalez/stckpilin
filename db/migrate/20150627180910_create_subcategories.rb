class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.string :category_id

      t.timestamps null: false
    end
  end
end
