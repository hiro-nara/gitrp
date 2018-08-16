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

ActiveRecord::Schema.define(version: 2018_05_27_073029) do

  create_table "Objectives", force: :cascade do |t|
    t.string "titel"
    t.text "content"
    t.text "criteria_1"
    t.text "criteria_2"
    t.text "criteria_3"
    t.text "criteria_4"
    t.string "difficulty"
    t.integer "weight"
    t.text "consequence"
    t.text "consequence_evaluator"
    t.string "self_evaluation"
    t.string "primary_evaluation"
    t.string "secondary_evaluation"
    t.float "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "po_sheet_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "po_sheets", force: :cascade do |t|
    t.string "status"
    t.integer "season_index"
    t.string "sheet_type"
    t.integer "year"
    t.string "period"
    t.string "tokyu"
    t.integer "grade"
    t.integer "grade_c"
    t.text "grade_reason"
    t.string "position"
    t.string "department"
    t.string "department_c"
    t.text "notices"
    t.integer "sales_plan"
    t.integer "profit_plan"
    t.integer "sales_result"
    t.integer "profit_result"
    t.integer "total_point"
    t.string "zone_primary"
    t.string "zone_secondary"
    t.integer "author_id"
    t.integer "primary_evaluator_id"
    t.integer "secondary_evaluator_id"
    t.integer "objective_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "po_sheet_id"
    t.string "dep_1st"
    t.string "dep_2st"
    t.string "dep_3st"
    t.string "dep_bunshitsu"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "season_index"
    t.integer "year"
    t.string "period"
    t.string "nen_ki"
    t.string "hyouki"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "staff_no"
    t.string "name"
    t.string "department"
    t.string "dep_1st"
    t.string "dep_2nd"
    t.string "dep_3rd"
    t.string "dep_bunshitsu"
    t.string "position"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.string "tokyu"
    t.string "grade"
  end

end
