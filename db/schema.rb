# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_02_055151) do

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "kind"
  end

  create_table "people_schedule_items", id: false, force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "schedule_item_id", null: false
    t.index ["schedule_item_id", "person_id"], name: "schedule_item_id_person_join_index", unique: true
  end

# Could not dump table "schedule_items" because of following StandardError
#   Unknown type '' for column 'is_global'

# Could not dump table "users" because of following StandardError
#   Unknown type 'bool' for column 'is_admin'

end
