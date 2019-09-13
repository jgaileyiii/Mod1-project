# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_12_211132) do

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "restaurants_id"
    t.integer "users_id"
    t.index ["restaurants_id"], name: "index_favorites_on_restaurants_id"
    t.index ["users_id"], name: "index_favorites_on_users_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.string "ingredients"
    t.integer "price"
    t.integer "restaurant_id"
    t.integer "cuisine_id"
    t.boolean "favorite", default: false
    t.index ["cuisine_id"], name: "index_menu_items_on_cuisine_id"
    t.index ["restaurant_id"], name: "index_menu_items_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "rating"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
