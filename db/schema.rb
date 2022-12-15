# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_15_094335) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menu_items", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "restaurant_id", null: false
    t.integer "price"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_menu_items_on_product_id"
    t.index ["restaurant_id"], name: "index_menu_items_on_restaurant_id"
  end

  create_table "order_lines", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "menu_item_id"
    t.integer "quantity"
    t.integer "price"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_order_lines_on_menu_item_id"
    t.index ["order_id"], name: "index_order_lines_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "waiter_id", null: false
    t.bigint "restaurant_id", null: false
    t.integer "total"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id"
    t.index ["waiter_id"], name: "index_orders_on_waiter_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "sku"
    t.string "name"
    t.integer "price"
    t.integer "kind"
    t.datetime "discarded_at"
    t.boolean "global"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_products_on_discarded_at"
    t.index ["name"], name: "index_products_on_name", unique: true
    t.index ["sku"], name: "index_products_on_sku", unique: true
  end

  create_table "restaurant_staffs", force: :cascade do |t|
    t.bigint "waiter_id", null: false
    t.bigint "restaurant_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_restaurant_staffs_on_discarded_at"
    t.index ["restaurant_id"], name: "index_restaurant_staffs_on_restaurant_id"
    t.index ["waiter_id"], name: "index_restaurant_staffs_on_waiter_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.bigint "manager_id"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_restaurants_on_manager_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "role"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
  end

  add_foreign_key "menu_items", "products"
  add_foreign_key "menu_items", "restaurants"
  add_foreign_key "order_lines", "menu_items"
  add_foreign_key "order_lines", "orders"
  add_foreign_key "orders", "restaurants"
  add_foreign_key "orders", "users", column: "client_id"
  add_foreign_key "orders", "users", column: "waiter_id"
  add_foreign_key "restaurant_staffs", "restaurants"
  add_foreign_key "restaurant_staffs", "users", column: "waiter_id"
  add_foreign_key "restaurants", "users", column: "manager_id"
end
