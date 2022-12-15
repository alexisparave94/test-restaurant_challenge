class CreateRestaurantStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_staffs do |t|
      t.references :waiter, null: false, foreign_key: { to_table: :users }
      t.references :restaurant, null: false, foreign_key: true
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :restaurant_staffs, :discarded_at
  end
end
