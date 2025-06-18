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

ActiveRecord::Schema[8.0].define(version: 2025_06_18_193120) do
  create_table "email_group_memberships", force: :cascade do |t|
    t.integer "email_group_id", null: false
    t.integer "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_group_id"], name: "index_email_group_memberships_on_email_group_id"
    t.index ["member_id"], name: "index_email_group_memberships_on_member_id"
  end

  create_table "email_groups", force: :cascade do |t|
    t.string "name"
    t.string "group_email"
    t.integer "message_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade do |t|
    t.integer "email_group_id", null: false
    t.string "subject"
    t.text "body"
    t.string "from_address"
    t.datetime "received_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_group_id"], name: "index_emails_on_email_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "email_group_memberships", "email_groups"
  add_foreign_key "email_group_memberships", "members"
  add_foreign_key "emails", "email_groups"
end
