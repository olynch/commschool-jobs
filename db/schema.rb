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

ActiveRecord::Schema.define(version: 20141012232244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crew_heads", force: true do |t|
    t.string   "name"
    t.integer  "crew_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crews", force: true do |t|
    t.string   "color"
    t.string   "day"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.integer  "crew_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "week_types", force: true do |t|
    t.string   "monday"
    t.string   "tuesday"
    t.string   "wednesday"
    t.string   "thursday"
    t.string   "friday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weeks", force: true do |t|
    t.string   "color"
    t.date     "start_day"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "week_type_id"
  end

  add_index "weeks", ["week_type_id"], name: "index_weeks_on_week_type_id", using: :btree

end
