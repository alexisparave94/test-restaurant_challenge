class Product < ApplicationRecord
  has_many :menu_items, dependent: :destroy
  has_many :restaurants, through: :menu_items

  after_save :add_global_product_to_all_menus

  enum :kind, %i[starter main_course salad soup dessert drink]

  def add_global_product_to_all_menus
    return unless global

    Restaurant.all.each do |res|
      MenuItem.create(restaurant: res, product: self)
    end
  end
end
