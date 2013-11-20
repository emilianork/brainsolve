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

ActiveRecord::Schema.define(version: 20131107191912) do

  create_table "areas_of_knowledges", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "acronym"
  end

  create_table "currencies", force: true do |t|
    t.string   "country"
    t.string   "acronym"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.integer  "solution_id"
    t.integer  "problem_id"
    t.integer  "user_id"
    t.boolean  "view"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "problems", force: true do |t|
    t.text     "title",                 null: false
    t.string   "contact"
    t.text     "description",           null: false
    t.integer  "user_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "telephone"
    t.integer  "areas_of_knowledge_id"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solutions", force: true do |t|
    t.text     "text",              null: false
    t.integer  "estimate"
    t.string   "email",             null: false
    t.string   "company"
    t.integer  "problem_id",        null: false
    t.integer  "user_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "telephone"
    t.string   "company_telephone"
    t.integer  "currency_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.string   "first_name"
    t.string   "second_name"
    t.string   "third_name"
    t.string   "role",                             null: false
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
    t.string   "telephone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
