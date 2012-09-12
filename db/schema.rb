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

ActiveRecord::Schema.define(:version => 20120912201457) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.integer  "department_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.integer  "division_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "divisions", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entrants", :force => true do |t|
    t.string   "name_first"
    t.string   "name_middle"
    t.string   "name_last"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_zip_code"
    t.string   "phone_primary"
    t.string   "phone_alternate"
    t.string   "email_address"
    t.string   "for_year"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "card_number"
  end

  create_table "prizes", :force => true do |t|
    t.string   "name"
    t.integer  "amount_cents"
    t.string   "amount_currency"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "color"
  end

  create_table "users", :force => true do |t|
    t.string   "full_name"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "wins", :force => true do |t|
    t.integer  "entrant_id"
    t.integer  "category_id"
    t.integer  "prize_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
