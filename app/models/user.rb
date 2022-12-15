class User < ApplicationRecord
  has_one :restaurant, foreign_key: 'manager_id', inverse_of: 'manager', dependent: :nullify
  has_one :restaurant_staff, foreign_key: 'waiter_id', inverse_of: 'waiter', dependent: :destroy
  # has_one :restaurant_service, through: :restaurant_staff, class_name: 'Restaurant', foreign_key: 'restaurant_id'
  has_many :orders, foreign_key: 'client_id', inverse_of: 'client', dependent: :destroy # doubt??
  has_many :assigned_orders, class_name: 'Order', foreign_key: 'waiter_id', inverse_of: 'waiter', dependent: :destroy # doubt?'

  enum :role, %i[admin manager waiter client]
end
