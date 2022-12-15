class MenuItem < ApplicationRecord
  belongs_to :product
  belongs_to :restaurant

  has_many :order_lines, dependent: :nullify # It should be nullify
  has_many :orders, through: :order_lines
end
