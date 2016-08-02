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

ActiveRecord::Schema.define(version: 20160802174814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_sets", force: :cascade do |t|
    t.string   "code",                                  null: false
    t.string   "name",                                  null: false
    t.string   "type"
    t.string   "border"
    t.boolean  "online_only",           default: false
    t.string   "block"
    t.string   "magic_cards_info_code"
    t.string   "gatherer_code"
    t.datetime "release_date"
    t.index ["border"], name: "index_card_sets_on_border", using: :btree
    t.index ["code"], name: "index_card_sets_on_code", using: :btree
    t.index ["gatherer_code"], name: "index_card_sets_on_gatherer_code", using: :btree
    t.index ["magic_cards_info_code"], name: "index_card_sets_on_magic_cards_info_code", using: :btree
    t.index ["online_only"], name: "index_card_sets_on_online_only", using: :btree
    t.index ["type"], name: "index_card_sets_on_type", using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.string "unique_id"
    t.string "name"
    t.text   "oracle_text"
    t.index ["name"], name: "index_cards_on_name", using: :btree
    t.index ["unique_id"], name: "index_cards_on_unique_id", using: :btree
  end

  create_table "printings", force: :cascade do |t|
    t.integer "card_id",       null: false
    t.string  "multiverse_id"
    t.text    "image_url"
    t.text    "flavor_text"
    t.integer "card_set_id"
    t.index ["card_id"], name: "index_printings_on_card_id", using: :btree
    t.index ["multiverse_id"], name: "index_printings_on_multiverse_id", using: :btree
  end

end
