class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.references :manager, null: true, foreign_key: { to_table: :users } # Null true because it could don't have amanager at the begining ??
      t.string :address
      t.string :city
      t.string :country
      t.string :phone

      t.timestamps
    end
  end
end
