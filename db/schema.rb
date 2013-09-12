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

ActiveRecord::Schema.define(:version => 20130912170251) do

  create_table "album_images", :force => true do |t|
    t.integer "album_id"
    t.string  "album_image_file_name",    :limit => 100
    t.integer "album_image_file_size"
    t.string  "album_image_file_type",    :limit => 50
    t.string  "album_image_content_type", :limit => 50
    t.string  "status",                   :limit => 1
    t.integer "order_no"
    t.text    "caption"
    t.date    "upload_date"
  end

  create_table "albums", :force => true do |t|
    t.string  "title",       :limit => 50
    t.date    "upload_date"
    t.date    "modify_date"
    t.string  "status",      :limit => 1
    t.integer "order_no",                  :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
