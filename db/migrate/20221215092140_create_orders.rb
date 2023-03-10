class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: { to_table: :users }
      t.references :waiter, null: true, foreign_key: { to_table: :users }
      t.references :restaurant, null: false, foreign_key: true
      t.integer :total, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
