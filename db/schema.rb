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

ActiveRecord::Schema.define(version: 2020_02_26_184208) do

  create_table "global_meetings", force: :cascade do |t|
    t.integer "schedule_item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_item_id"], name: "index_global_meetings_on_schedule_item_id"
  end

  create_table "group_meetings", force: :cascade do |t|
    t.integer "schedule_item_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_meetings_on_group_id"
    t.index ["schedule_item_id"], name: "index_group_meetings_on_schedule_item_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "personal_meetings", force: :cascade do |t|
    t.integer "schedule_item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_item_id"], name: "index_personal_meetings_on_schedule_item_id"
  end

  create_table "personal_meetings_students", id: false, force: :cascade do |t|
    t.integer "personal_meeting_id", null: false
    t.integer "student_id", null: false
    t.index ["personal_meeting_id", "student_id"], name: "meeting_student_join_index"
  end

  create_table "schedule_items", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "group_id"
    t.index ["group_id"], name: "index_students_on_group_id"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'bool' for column 'is_admin'

  add_foreign_key "global_meetings", "schedule_items"
  add_foreign_key "group_meetings", "groups"
  add_foreign_key "group_meetings", "schedule_items"
  add_foreign_key "personal_meetings", "schedule_items"
  add_foreign_key "students", "groups"
end
