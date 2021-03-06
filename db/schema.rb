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

ActiveRecord::Schema.define(version: 2018_10_21_081530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "cards", force: :cascade do |t|
    t.bigint "phrase_id"
    t.bigint "deck_id"
    t.string "status", default: "learning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_cards_on_deck_id"
    t.index ["phrase_id", "deck_id"], name: "index_cards_on_phrase_id_and_deck_id", unique: true
    t.index ["phrase_id"], name: "index_cards_on_phrase_id"
  end

  create_table "decks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_decks_on_language_id"
    t.index ["user_id", "language_id"], name: "index_decks_on_user_id_and_language_id", unique: true
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "localised_name"
    t.string "iso2", limit: 2
    t.string "iso3", limit: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phrases", force: :cascade do |t|
    t.text "text"
    t.text "localised_text"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_phrases_on_language_id"
  end

  create_table "translations", force: :cascade do |t|
    t.text "text"
    t.text "localised_text"
    t.bigint "phrase_id"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_translations_on_language_id"
    t.index ["phrase_id"], name: "index_translations_on_phrase_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_languages", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "language_id"
    t.index ["language_id"], name: "index_users_languages_on_language_id"
    t.index ["user_id"], name: "index_users_languages_on_user_id"
  end

  add_foreign_key "cards", "decks"
  add_foreign_key "cards", "phrases"
  add_foreign_key "phrases", "languages"
  add_foreign_key "translations", "languages"
  add_foreign_key "translations", "phrases"
end
