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

ActiveRecord::Schema[7.1].define(version: 2024_04_14_070309) do
  create_table "attractions", force: :cascade do |t|
    t.string "name_attraction"
    t.string "category"
    t.text "description"
    t.integer "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_attractions_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name_city"
    t.integer "population"
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "cities_users", id: false, force: :cascade do |t|
    t.integer "city_id", null: false
    t.integer "user_id", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "capital"
    t.integer "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", id: false, force: :cascade do |t|
    t.integer "attraction_id", null: false
    t.integer "user_id", null: false
    t.decimal "grade", precision: 4, scale: 1
  end

  create_table "users", force: :cascade do |t|
    t.string "name_user"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attractions", "cities"
  add_foreign_key "cities", "countries"
end
