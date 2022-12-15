class User < ApplicationRecord
  has_one :restaurant, foreign_key: 'manager_id', inverse_of: 'manager', dependent: :nullify
  has_many :restaurant_staffs, foreign_key: 'waiter_id', inverse_of: 'waiter', dependent: :destroy
  has_many :assigned_restaurants, through: :restaurant_staffs, class_name: 'Restaurant', foreign_key: 'restaurant_id'
  has_many :orders, foreign_key: 'client_id', inverse_of: 'client', dependent: :destroy # doubt??
  has_many :assigned_orders, class_name: 'Order', foreign_key: 'waiter_id', inverse_of: 'waiter', dependent: :nullify # doubt?'

  enum :role, %i[client waiter manager admin] # client = customer
end
