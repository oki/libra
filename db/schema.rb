# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080605111852) do

  create_table "books", :force => true do |t|
    t.integer  "quantity",   :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id",   :limit => 11
    t.string   "author"
    t.string   "title"
    t.string   "isbn"
    t.string   "print"
    t.text     "content"
    t.integer  "version",    :limit => 11
    t.integer  "user_id",    :limit => 11
  end

  create_table "description_versions", :force => true do |t|
    t.integer  "description_id", :limit => 11
    t.integer  "version",        :limit => 11
    t.integer  "user_id",        :limit => 11
    t.string   "author"
    t.string   "title"
    t.string   "isbn"
    t.string   "print"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", :force => true do |t|
    t.integer  "user_id",             :limit => 11
    t.integer  "book_id",             :limit => 11
    t.datetime "date_issued"
    t.datetime "date_due_for_return"
    t.datetime "date_returned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owners", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", :force => true do |t|
    t.integer  "user_id",     :limit => 11
    t.datetime "date_issued"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.integer  "book_id",    :limit => 11
    t.integer  "loan_id",    :limit => 11
    t.integer  "request_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
