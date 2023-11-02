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

ActiveRecord::Schema.define(version: 20231101195607) do

  create_table "opportunities", force: :cascade do |t|
    t.string   "title"
    t.string   "professor_name"
    t.string   "department"
    t.text     "description"
    t.string   "contact"
    t.text     "requirements"
    t.string   "duration"
    t.integer  "capacity"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "user_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "applications", force: :cascade do |t|
    t.references :user, null: false, foreign_key: true
    t.references :opportunity, null: false, foreign_key: true
    t.string :status, default: 'pending'
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
