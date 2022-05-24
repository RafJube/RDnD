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

ActiveRecord::Schema.define(version: 2022_05_24_142809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "duck_skills", force: :cascade do |t|
    t.bigint "duck_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["duck_id"], name: "index_duck_skills_on_duck_id"
    t.index ["skill_id"], name: "index_duck_skills_on_skill_id"
  end

  create_table "ducks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.decimal "average_rating"
    t.string "skills", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_ducks_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "duck_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["duck_id"], name: "index_favorites_on_duck_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.decimal "rating"
    t.datetime "date_start"
    t.datetime "date_end"
    t.text "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "duck_id", null: false
    t.bigint "user_id", null: false
    t.index ["duck_id"], name: "index_rentals_on_duck_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "duck_skills", "ducks"
  add_foreign_key "duck_skills", "skills"
  add_foreign_key "ducks", "users"
  add_foreign_key "favorites", "ducks"
  add_foreign_key "favorites", "users"
  add_foreign_key "rentals", "ducks"
  add_foreign_key "rentals", "users"
end
