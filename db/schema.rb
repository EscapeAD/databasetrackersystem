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

ActiveRecord::Schema.define(version: 20170216205023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booths", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "name"
    t.date     "start"
    t.date     "end"
    t.string   "sponser"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_booths_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "start"
    t.date     "end"
    t.string   "contact"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resbooths", force: :cascade do |t|
    t.integer  "booth_id"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booth_id"], name: "index_resbooths_on_booth_id", using: :btree
    t.index ["person_id"], name: "index_resbooths_on_person_id", using: :btree
  end

  create_table "reserves", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "person_id"
    t.boolean  "ticket",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "event_hex"
    t.index ["event_id"], name: "index_reserves_on_event_id", using: :btree
    t.index ["person_id"], name: "index_reserves_on_person_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "booths", "events"
  add_foreign_key "resbooths", "booths"
  add_foreign_key "resbooths", "people"
  add_foreign_key "reserves", "events"
  add_foreign_key "reserves", "people"
end
