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

ActiveRecord::Schema[8.0].define(version: 2024_12_25_180726) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "phrase_tags", force: :cascade do |t|
    t.bigint "phrase_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phrase_id"], name: "index_phrase_tags_on_phrase_id"
    t.index ["tag_id"], name: "index_phrase_tags_on_tag_id"
  end

  create_table "phrases", force: :cascade do |t|
    t.string "text"
    t.text "meaning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "difficulty_level"
    t.string "tags", default: [], array: true
    t.json "related_phrases"
    t.string "audio_url"
    t.string "examples", default: [], array: true
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.bigint "phrase_id", null: false
    t.string "question_text"
    t.string "correct_answer"
    t.string "wrong_answers", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phrase_id"], name: "index_questions_on_phrase_id"
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
  end

  add_foreign_key "phrase_tags", "phrases"
  add_foreign_key "phrase_tags", "tags"
  add_foreign_key "questions", "phrases"
  add_foreign_key "questions", "quizzes"
end
