class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :client, null: false, foreign_key: { to_table: :users }
      t.references :waiter, null: false, foreign_key: { to_table: :users }
      t.references :restaurant, null: false, foreign_key: true
      t.integer :total
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
