class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price, default: 0
      t.integer :category
      t.datetime :discarded_at
      t.boolean :global, default: false # I think it should be false

      t.timestamps
    end
    add_index :products, :sku, unique: true
    add_index :products, :name, unique: true
    add_index :products, :discarded_at
  end
end
