# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_10_090414) do

  create_table "airlines", force: :cascade do |t|
    t.string "name"
    t.string "business_model"
    t.date "founded"
  end

  create_table "flights", force: :cascade do |t|
    t.string "origin"
    t.string "destination"
    t.datetime "date_time"
    t.integer "price"
    t.integer "airline_id"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "flight_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "username"
    t.string "password"
  end

end
