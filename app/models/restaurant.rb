class Restaurant < ApplicationRecord
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id', optional: true
  has_many :restaurant_staffs, dependent: :destroy
  has_many :waiters, through: :restaurant_staffs, class_name: 'User', foreign_key: 'waiter_id'
  # has_one :restaurant_service, through: :restaurant_staffs
  has_many :menu_items, dependent: :destroy
  has_many :products, through: :menu_items
  has_many :orders, dependent: :destroy # doubt ???
end
