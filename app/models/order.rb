class Order < ApplicationRecord
  belongs_to :customer, class_name: 'User', foreign_key: 'customer_id'
  belongs_to :waiter, class_name: 'User', foreign_key: 'waiter_id', optional: true
  belongs_to :restaurant

  has_many :order_lines, dependent: :destroy
  has_many :menu_items, through: :order_lines

  enum :status, %i[open confirmed completed canceled]
end
