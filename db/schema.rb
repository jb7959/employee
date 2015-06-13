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

ActiveRecord::Schema.define(version: 20150613070734) do

  create_table "calculate_pays", force: true do |t|
    t.string   "emp_id"
    t.integer  "pay"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "name"
    t.text     "adress"
    t.string   "payment_type"
    t.integer  "salary"
    t.integer  "hourly_rate"
    t.float    "commision_rate"
    t.string   "Affiliation_type"
    t.integer  "Dues",                limit: 255, default: 0
    t.string   "payment_method_type"
    t.string   "bank_name"
    t.string   "bank_account"
    t.string   "mail_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "emp_id"
    t.string   "union_id"
  end

  create_table "pay_days", force: true do |t|
    t.string   "emp_id"
    t.string   "name"
    t.string   "payment_type"
    t.integer  "pay"
    t.date     "lastPayday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales_receipts", force: true do |t|
    t.string   "emp_id"
    t.integer  "amount"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_charges", force: true do |t|
    t.string   "emp_id"
    t.integer  "charge"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_cards", force: true do |t|
    t.string   "emp_id"
    t.date     "date"
    t.integer  "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
