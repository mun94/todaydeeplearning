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

ActiveRecord::Schema.define(version: 20170404032308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arvix_papers", force: :cascade do |t|
    t.datetime "paper_updated_at"
    t.datetime "published_date"
    t.string   "title",                          null: false
    t.text     "summary"
    t.text     "comment"
    t.string   "paper_link"
    t.string   "pdf_link"
    t.string   "category",                       null: false
    t.jsonb    "raw_data"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "thumbnail"
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.index ["title"], name: "index_arvix_papers_on_title", using: :btree
  end

  create_table "author_paper_connections", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "arvix_paper_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["arvix_paper_id"], name: "index_author_paper_connections_on_arvix_paper_id", using: :btree
    t.index ["author_id"], name: "index_author_paper_connections_on_author_id", using: :btree
  end

  create_table "authors", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  add_foreign_key "author_paper_connections", "arvix_papers"
  add_foreign_key "author_paper_connections", "authors"
end
