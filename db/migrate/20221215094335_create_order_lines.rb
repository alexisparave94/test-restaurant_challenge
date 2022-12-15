class CreateOrderLines < ActiveRecord::Migration[7.0]
  def change
    create_table :order_lines do |t|
      t.references :order, null: false, foreign_key: true
      t.references :menu_item, null: true, foreign_key: true
      t.integer :quantity
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end
