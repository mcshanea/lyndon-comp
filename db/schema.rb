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

ActiveRecord::Schema[7.0].define(version: 2023_06_12_092136) do
  create_table "applicants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "ticket_reference"
    t.integer "answer"
    t.date "entry_date"
    t.integer "competition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "order_id"
    t.boolean "won"
    t.string "phone"
    t.index ["competition_id"], name: "index_applicants_on_competition_id"
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prizes", force: :cascade do |t|
    t.string "name"
    t.float "value"
    t.integer "winner_id"
    t.integer "competition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prize_position"
    t.index ["competition_id"], name: "index_prizes_on_competition_id"
  end

  add_foreign_key "applicants", "competitions"
  add_foreign_key "prizes", "competitions"
end
