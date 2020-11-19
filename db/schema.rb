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

ActiveRecord::Schema.define(version: 2020_11_14_071538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "url"
    t.boolean "enable_payment", default: false, null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_groups_on_organization_id"
  end

  create_table "identities", force: :cascade do |t|
    t.string "sentry_id_profile"
    t.string "sentry_risk_profile"
    t.string "list_of_sentinel_profile"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_day"
    t.string "social_security_number"
    t.boolean "fcra_status"
    t.integer "sentry_id_dcore"
    t.integer "sentry_rick_score"
    t.boolean "alert_flag"
    t.string "type_of_alert"
    t.string "pfd_report"
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_identities_on_group_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.string "contact"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "list_of_group_ids"
    t.string "list_of_sentry__id_profile"
    t.string "list_of_sentinel_profile"
    t.integer "current_fcra_count"
    t.integer "subscribe_fcra_count"
    t.string "current_internal_user_count"
    t.integer "subscribe_internal_user_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone"
    t.string "email"
    t.integer "current_identity_count_a"
    t.integer "current_identity_count_b"
    t.integer "current_identity_count_c"
    t.integer "current_identity_count_e"
    t.integer "subscribed_identity_count_a"
    t.integer "subscribed_identity_count_b"
    t.integer "subscribed_identity_count_c"
    t.integer "subscribed_identity_count_d"
    t.string "list_of_sentry_risk_profile"
    t.integer "alert_count"
  end

  create_table "organizations_investigators", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "user_id", null: false
    t.index ["organization_id"], name: "index_organizations_investigators_on_organization_id"
    t.index ["user_id"], name: "index_organizations_investigators_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", null: false
    t.integer "role", default: 0, null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.bigint "organization_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "groups", "organizations"
  add_foreign_key "identities", "groups"
  add_foreign_key "organizations_investigators", "organizations"
  add_foreign_key "organizations_investigators", "users"
  add_foreign_key "users", "organizations"
end
