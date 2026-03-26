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

ActiveRecord::Schema[8.1].define(version: 2026_03_26_083558) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "end_date"
    t.bigint "room_id", null: false
    t.date "start_date"
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_bookings_on_room_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "author"
    t.string "cover_url"
    t.datetime "created_at", null: false
    t.text "description"
    t.float "rating"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "reading_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "readings", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.text "note"
    t.bigint "reading_list_id", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id", "reading_list_id"], name: "index_readings_on_book_id_and_reading_list_id", unique: true
    t.index ["book_id"], name: "index_readings_on_book_id"
    t.index ["reading_list_id"], name: "index_readings_on_reading_list_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.float "daily_price"
    t.bigint "hotel_id", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  add_foreign_key "bookings", "rooms"
  add_foreign_key "readings", "books"
  add_foreign_key "readings", "reading_lists"
  add_foreign_key "rooms", "hotels"
end
