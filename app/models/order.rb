class Order < ApplicationRecord
  belongs_to :client, class_name: 'User', foreign_key: 'client_id'
  belongs_to :waiter, class_name: 'User', foreign_key: 'waiter_id'
  belongs_to :restaurant

  has_many :order_lines, dependent: :destroy
  has_many :menu_items, through: :order_lines

  enum :role, %i[waiting pending completed]
end
