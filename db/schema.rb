# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_17_114000) do

  create_table "channels", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_channels_on_title", unique: true
    t.index ["url"], name: "index_channels_on_url", unique: true
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "author"
    t.string "description"
    t.date "pubdate"
    t.integer "channel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_news_on_channel_id"
    t.index ["pubdate"], name: "index_news_on_pubDate", unique: true
    t.index ["title"], name: "index_news_on_title"
  end

  add_foreign_key "news", "channels"
end
