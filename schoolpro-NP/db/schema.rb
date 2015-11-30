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

ActiveRecord::Schema.define(version: 20151127011052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "campernumbers", force: true do |t|
    t.string   "park_name"
    t.integer  "jan"
    t.integer  "feb"
    t.integer  "mar"
    t.integer  "apr"
    t.integer  "may"
    t.integer  "jun"
    t.integer  "jul"
    t.integer  "aug"
    t.integer  "sep"
    t.integer  "oct"
    t.integer  "nov"
    t.integer  "dec"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fire_levels", force: true do |t|
    t.string   "park_name"
    t.string   "date"
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "park_name"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "models", ["email"], :name => "index_models_on_email", :unique => true
  add_index "models", ["reset_password_token"], :name => "index_models_on_reset_password_token", :unique => true

  create_table "monthly_fire_levels", force: true do |t|
    t.string   "park_name"
    t.integer  "jan"
    t.integer  "feb"
    t.integer  "mar"
    t.integer  "apr"
    t.integer  "may"
    t.integer  "jun"
    t.integer  "jul"
    t.integer  "aug"
    t.integer  "sep"
    t.integer  "oct"
    t.integer  "nov"
    t.integer  "dec"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monthly_prcps", force: true do |t|
    t.string   "park_name"
    t.float    "jan"
    t.float    "feb"
    t.float    "mar"
    t.float    "apr"
    t.float    "may"
    t.float    "jun"
    t.float    "jul"
    t.float    "aug"
    t.float    "sep"
    t.float    "oct"
    t.float    "nov"
    t.float    "dec"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "montly_temps", force: true do |t|
    t.string   "park_name"
    t.float    "jan"
    t.float    "feb"
    t.float    "mar"
    t.float    "apr"
    t.float    "may"
    t.float    "jun"
    t.float    "jul"
    t.float    "aug"
    t.float    "sep"
    t.float    "oct"
    t.float    "nov"
    t.float    "dec"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parks", force: true do |t|
    t.string   "park_name"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nation"
  end

  create_table "provinces", force: true do |t|
    t.string   "name",                                                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "geom",       limit: {:srid=>4326, :type=>"multi_polygon"}
  end

  add_index "provinces", ["geom"], :name => "index_provinces_on_geom", :spatial => true

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "visitornumbers", force: true do |t|
    t.string   "park_name"
    t.integer  "jan"
    t.integer  "feb"
    t.integer  "mar"
    t.integer  "apr"
    t.integer  "may"
    t.integer  "jun"
    t.integer  "jul"
    t.integer  "aug"
    t.integer  "sep"
    t.integer  "oct"
    t.integer  "nov"
    t.integer  "dec"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weathers", force: true do |t|
    t.string   "park_name"
    t.date     "date"
    t.float    "temp"
    t.float    "precip"
    t.float    "wind"
    t.float    "humidity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fireLevel"
  end

end
