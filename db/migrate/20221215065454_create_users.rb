class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :role # It has to be a default value??
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :users, :discarded_at
  end
end
