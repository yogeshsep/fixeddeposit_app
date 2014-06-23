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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140623104213) do

  create_table "fixeddeposits", :force => true do |t|
    t.string   "customername"
    t.date     "dateofbirth"
    t.string   "gender"
    t.text     "address"
    t.string   "city"
    t.date     "openedon"
    t.float    "depositamount"
    t.date     "maturitydate"
    t.float    "interestamount"
    t.float    "rateofinterest"
    t.integer  "periods"
    t.integer  "age"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "interestrates", :force => true do |t|
    t.integer  "dayfrom"
    t.integer  "dayto"
    t.float    "rate"
    t.float    "seniorincrement"
    t.float    "superseniorincrement"
    t.float    "widowincrement"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "interestsetup_id"
  end

  create_table "interestsetups", :force => true do |t|
    t.date     "effectivefrom"
    t.date     "effectiveto"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
