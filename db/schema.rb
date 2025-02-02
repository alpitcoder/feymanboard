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

ActiveRecord::Schema.define(version: 2021_03_01_112055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "block_remarks", force: :cascade do |t|
    t.integer "status"
    t.bigint "block_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["block_id"], name: "index_block_remarks_on_block_id"
    t.index ["user_id"], name: "index_block_remarks_on_user_id"
  end

  create_table "blocks", force: :cascade do |t|
    t.text "value"
    t.bigint "topic_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id"], name: "index_blocks_on_topic_id"
  end

  create_table "topic_knowledges", force: :cascade do |t|
    t.bigint "topic_id"
    t.bigint "user_id"
    t.integer "percentage_of_understanging"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id"], name: "index_topic_knowledges_on_topic_id"
    t.index ["user_id"], name: "index_topic_knowledges_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.integer "percentage_of_understanging"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "content"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "block_remarks", "blocks"
  add_foreign_key "block_remarks", "users"
  add_foreign_key "blocks", "topics"
  add_foreign_key "topic_knowledges", "topics"
  add_foreign_key "topic_knowledges", "users"
  add_foreign_key "topics", "users"
end
