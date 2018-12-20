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

ActiveRecord::Schema.define(version: 20181220164425) do

  create_table "cultivars", force: :cascade do |t|
    t.string   "name"
    t.integer  "fruit_weight_gr"
    t.integer  "species_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["species_id"], name: "index_cultivars_on_species_id"
  end

  create_table "species", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "yieldrecs", force: :cascade do |t|
    t.string   "plot_strength"
    t.integer  "recommended_kg"
    t.integer  "cultivar_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["cultivar_id"], name: "index_yieldrecs_on_cultivar_id"
  end

end
