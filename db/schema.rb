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

ActiveRecord::Schema.define(version: 20151202044418) do

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.string   "title"
    t.string   "pcountry"
    t.string   "pstate"
    t.string   "pcity"
    t.string   "paddress"
    t.integer  "pzipcode"
    t.string   "dcountry"
    t.string   "dstate"
    t.string   "dcity"
    t.string   "daddress"
    t.integer  "dzipcode"
    t.float    "weight"
    t.float    "heigth"
    t.float    "width"
    t.float    "length"
    t.integer  "delday"
    t.string   "delmonth"
    t.integer  "delyear"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "picture"
  end

  create_table "trips", force: :cascade do |t|
    t.string   "icountry"
    t.string   "istate"
    t.string   "icity"
    t.string   "iaddress"
    t.integer  "izipcode"
    t.string   "fcountry"
    t.string   "fstate"
    t.string   "fcity"
    t.string   "faddress"
    t.integer  "fzipcode"
    t.integer  "day"
    t.string   "month"
    t.integer  "year"
    t.integer  "maxweight"
    t.integer  "maxheigth"
    t.integer  "maxwidth"
    t.integer  "maxlength"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "picture"
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.string   "role",            default: "Customer"
    t.integer  "rating",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.string   "picture"
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
  end

end
