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

ActiveRecord::Schema.define(version: 20181223115150) do

  create_table "cultivars", force: :cascade do |t|
    t.string   "name"
    t.integer  "fruit_weight_gr"
    t.integer  "species_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "has_arms",        default: false
    t.index ["species_id"], name: "index_cultivars_on_species_id"
  end

  create_table "plots", force: :cascade do |t|
    t.integer  "linedist_meters"
    t.integer  "treedist_meters"
    t.integer  "arms"
    t.integer  "yieldwish_kg"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
    t.integer  "trees_per_dunam"
    t.integer  "kg_per_tree"
    t.integer  "fruits_per_tree"
    t.integer  "fruits_per_arm"
    t.integer  "cultivar_id"
    t.integer  "species_id"
    t.string   "strength"
    t.integer  "yieldrec_id"
    t.index ["cultivar_id"], name: "index_plots_on_cultivar_id"
    t.index ["species_id"], name: "index_plots_on_species_id"
    t.index ["yieldrec_id"], name: "index_plots_on_yieldrec_id"
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
