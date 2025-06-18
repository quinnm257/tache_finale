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

ActiveRecord::Schema[8.0].define(version: 2025_06_18_145819) do
  create_table "categories", force: :cascade do |t|
    t.text "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "country_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.text "customer_name"
    t.text "email"
    t.text "phone"
    t.text "delivery_address"
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_customers_on_country_id"
  end

  create_table "employees", force: :cascade do |t|
    t.text "employee_name"
    t.integer "store_id", null: false
    t.string "position"
    t.date "hire_date"
    t.date "birth_date"
    t.text "phone"
    t.text "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_employees_on_store_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.text "instrument_name"
    t.integer "manufacturer_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_instruments_on_category_id"
    t.index ["manufacturer_id"], name: "index_instruments_on_manufacturer_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "instrument_id", null: false
    t.text "serial_number"
    t.text "description"
    t.text "condition"
    t.integer "production_year"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instrument_id"], name: "index_items_on_instrument_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "manufacturer_name"
    t.integer "country_id", null: false
    t.text "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_manufacturers_on_country_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "employee_id", null: false
    t.date "order_date"
    t.date "delivery_date"
    t.string "payment_status"
    t.string "delivery_status"
    t.decimal "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["employee_id"], name: "index_orders_on_employee_id"
  end

  create_table "repairs", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "customer_id", null: false
    t.date "repair_date"
    t.text "description"
    t.decimal "price"
    t.string "payment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_repairs_on_customer_id"
    t.index ["item_id"], name: "index_repairs_on_item_id"
  end

  create_table "stores", force: :cascade do |t|
    t.text "store_name"
    t.text "address"
    t.text "phone"
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_stores_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customers", "countries"
  add_foreign_key "employees", "stores"
  add_foreign_key "instruments", "categories"
  add_foreign_key "instruments", "manufacturers"
  add_foreign_key "items", "instruments"
  add_foreign_key "manufacturers", "countries"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "employees"
  add_foreign_key "repairs", "customers"
  add_foreign_key "repairs", "items"
  add_foreign_key "stores", "countries"
end
