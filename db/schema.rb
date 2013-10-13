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

ActiveRecord::Schema.define(version: 20131012231801) do

  create_table "problems", force: true do |t|
    t.text     "title",              null: false
    t.string   "contact"
    t.text     "description",        null: false
    t.integer  "telephone"
    t.string   "areas_of_knowledge", null: false
    t.integer  "user_id",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solutions", force: true do |t|
    t.text     "text",              null: false
    t.integer  "estimate"
    t.string   "currency"
    t.string   "email",             null: false
    t.integer  "telephone"
    t.string   "company"
    t.integer  "company_telephone"
    t.integer  "problem_id",        null: false
    t.integer  "user_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.string   "first_name"
    t.string   "second_name"
    t.string   "third_name"
    t.integer  "telephone"
    t.string   "role",                             null: false
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
