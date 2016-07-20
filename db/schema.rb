# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160720091754) do

  create_table "books", force: :cascade do |t|
    t.string "author",    limit: 255
    t.string "isbn",      limit: 255
    t.string "name",      limit: 255
    t.string "publisher", limit: 255
  end

  create_table "loans", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.date     "start_point"
    t.date     "end_point"
    t.float    "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "fine_amount"
    t.date     "fine_paid_on"
  end

  add_index "loans", ["book_id"], name: "index_loans_on_book_id"
  add_index "loans", ["user_id"], name: "index_loans_on_user_id"

  create_table "settings", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "email"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "address_city"
    t.string   "address_country"
    t.string   "address_postcode"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
