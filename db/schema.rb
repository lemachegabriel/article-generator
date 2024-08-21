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

ActiveRecord::Schema[7.0].define(version: 2024_08_21_151420) do
  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "param"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_ideas", force: :cascade do |t|
    t.string "name"
    t.integer "average_revenue"
    t.integer "average_cost_to_start"
    t.integer "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_business_ideas_on_article_id"
  end

  create_table "sections", force: :cascade do |t|
    t.text "text"
    t.integer "business_idea_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_idea_id"], name: "index_sections_on_business_idea_id"
  end

  add_foreign_key "business_ideas", "articles"
  add_foreign_key "sections", "business_ideas"
end
