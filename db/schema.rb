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

ActiveRecord::Schema.define(version: 2019_01_19_064928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "fname"
    t.string "mname"
    t.string "lname"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.float "amount"
    t.string "status"
    t.string "url1"
    t.string "url2"
    t.string "url3"
    t.string "url4"
    t.string "url5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.date "or_date"
    t.string "or_number"
    t.bigint "reservation_id"
    t.string "remarks"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_payments_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "reservation_date"
    t.string "reservation_time"
    t.string "package"
    t.float "amount"
    t.string "status"
    t.bigint "client_id"
    t.string "place_of_church"
    t.string "place_of_coverage"
    t.string "reception"
    t.string "recommended_by"
    t.string "tape"
    t.string "coverage"
    t.string "album"
    t.string "motif"
    t.string "excess_shots"
    t.string "free"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.index ["client_id"], name: "index_reservations_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "reset_password_token"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "payments", "reservations"
  add_foreign_key "reservations", "clients"
end
