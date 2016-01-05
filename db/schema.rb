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

ActiveRecord::Schema.define(version: 20160105042059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "instagram_id"
    t.string   "instagram_type"
    t.string   "name"
    t.string   "low_resolution_url"
    t.string   "standard_resolution_url"
    t.datetime "created_time"
    t.integer  "likes_count"
    t.integer  "comments_count"
    t.string   "thumbnail_url"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "roles",               default: [],              array: true
    t.string   "instagram_username"
    t.string   "company_name"
    t.string   "company_url"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "posts_count"
    t.integer  "followed_by"
    t.integer  "follows"
    t.string   "profile_picture_url"
    t.string   "personal_website"
    t.string   "instagram_id"
    t.text     "bio"
    t.string   "access_token"
    t.integer  "gender",              default: 0
  end

end
