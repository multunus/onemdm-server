# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160204094618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "app_usages", force: :cascade do |t|
    t.string   "package_name",              null: false
    t.integer  "usage_duration_in_seconds", null: false
    t.date     "used_on",                   null: false
    t.integer  "device_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "app_usages", ["device_id"], name: "index_app_usages_on_device_id", using: :btree

  create_table "apps", force: :cascade do |t|
    t.string   "name"
    t.string   "package_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "batch_installations", force: :cascade do |t|
    t.integer  "app_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "batch_installations", ["app_id"], name: "index_batch_installations_on_app_id", using: :btree

  create_table "devices", force: :cascade do |t|
    t.string   "model"
    t.string   "unique_id"
    t.string   "imei_number"
    t.string   "access_token"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "heartbeats_count",         default: 0
    t.datetime "last_heartbeat_recd_time"
    t.string   "gcm_token"
    t.string   "client_version"
    t.string   "os_version"
  end

  create_table "heartbeats", force: :cascade do |t|
    t.integer  "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "heartbeats", ["device_id"], name: "index_heartbeats_on_device_id", using: :btree

  create_table "installations", force: :cascade do |t|
    t.integer  "device_id"
    t.integer  "batch_installation_id"
    t.integer  "status",                default: 0, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "installations", ["batch_installation_id"], name: "index_installations_on_batch_installation_id", using: :btree
  add_index "installations", ["device_id"], name: "index_installations_on_device_id", using: :btree

  add_foreign_key "app_usages", "devices"
  add_foreign_key "batch_installations", "apps"
  add_foreign_key "heartbeats", "devices"
  add_foreign_key "installations", "batch_installations"
  add_foreign_key "installations", "devices"
end
