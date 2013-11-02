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

ActiveRecord::Schema.define(version: 20131101221049) do

  create_table "authorizations", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "servers", force: true do |t|
    t.string   "customer_name"
    t.string   "customer_email"
    t.string   "server_name"
    t.string   "server_id"
    t.string   "server_type"
    t.string   "server_public_ipaddress"
    t.string   "server_private_ipaddress"
    t.string   "server_account"
    t.string   "server_password"
    t.string   "server_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "uid",                                null: false
    t.string   "provider",                           null: false
    t.string   "email",                              null: false
    t.string   "first_name",                         null: false
    t.string   "last_name",                          null: false
    t.string   "github_username"
    t.string   "ssh_username"
    t.string   "ssh_public_key"
    t.string   "linux_password_hash"
    t.boolean  "enabled",             default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
