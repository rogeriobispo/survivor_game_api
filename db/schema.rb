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

ActiveRecord::Schema.define(version: 20180131164048) do

  create_table "inventories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "survivor_id"
    t.index ["survivor_id"], name: "index_inventories_on_survivor_id", using: :btree
  end

  create_table "survivors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                           null: false
    t.integer  "age",                            null: false
    t.string   "gender",                         null: false
    t.string   "last_latitude",                  null: false
    t.string   "last_longitude",                 null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "contaminated",   default: 0,     null: false
    t.boolean  "zumbie",         default: false
    t.integer  "inventory_id"
    t.index ["inventory_id"], name: "index_survivors_on_inventory_id", using: :btree
  end

  add_foreign_key "inventories", "survivors"
  add_foreign_key "survivors", "inventories"
end
