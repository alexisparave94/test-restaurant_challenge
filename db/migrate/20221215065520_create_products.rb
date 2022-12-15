class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.integer :price
      t.integer :type
      t.datetime :discarded_at
      t.boolean :global, default: false # I think it should be false

      t.timestamps
    end
    add_index :products, :sku, unique: true
    add_index :products, :name, unique: true
    add_index :products, :discarded_at
  end
end
