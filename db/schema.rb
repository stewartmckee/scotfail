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

ActiveRecord::Schema.define(:version => 20121115113657) do

  create_table "tweets", :force => true do |t|
    t.datetime "tweeted_at"
    t.integer  "tweet_id",                :limit => 8
    t.string   "text"
    t.integer  "in_reply_to_status_id",   :limit => 8
    t.integer  "in_reply_to_user_id",     :limit => 8
    t.string   "in_reply_to_screen_name"
    t.integer  "user_id",                 :limit => 8
    t.string   "geo"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.boolean  "classified",                           :default => false
    t.string   "classification"
  end

  create_table "users", :force => true do |t|
    t.integer  "twitter_id",        :limit => 8
    t.string   "name"
    t.string   "screen_name"
    t.string   "location"
    t.string   "description"
    t.string   "url"
    t.string   "profile_image_url"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

end
