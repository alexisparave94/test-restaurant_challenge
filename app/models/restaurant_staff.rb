class RestaurantStaff < ApplicationRecord
  belongs_to :waiter, class_name: 'User', foreign_key: 'waiter_id'
  belongs_to :restaurant
end
