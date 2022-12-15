class CreateMenuItems < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.integer :price
      t.integer :stock

      t.timestamps
    end
  end
end
