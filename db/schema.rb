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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120418051959) do

  create_table "systems", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "active",          :default => true
    t.integer  "start_time_hour", :default => 7
    t.integer  "start_time_min",  :default => 0
    t.integer  "stop_time_hour",  :default => 17
    t.integer  "stop_time_min",   :default => 0
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.string   "time_zone",       :default => "Pacific Time (US & Canada)"
    t.integer  "daily_max",       :default => 50
  end

  add_index "systems", ["user_id"], :name => "index_systems_on_user_id"

  create_table "tweets", :force => true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.text     "body"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "published_at"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "pending",      :default => false
  end

  add_index "tweets", ["user_id"], :name => "index_tweets_on_user_id"

  create_table "users", :force => true do |t|
    t.integer  "twitter_id"
    t.string   "username"
    t.string   "name"
    t.string   "image"
    t.string   "auth_token"
    t.string   "auth_secret"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "email"
  end

end
