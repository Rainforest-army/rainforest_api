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

ActiveRecord::Schema[7.0].define(version: 2022_08_09_162918) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "lnbits_user_id"
    t.string "auth_token"
    t.string "paid_invoice_webhook_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "wallet_id", null: false
    t.boolean "is_incoming"
    t.integer "category"
    t.integer "amount"
    t.string "event_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_id"], name: "index_events_on_wallet_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "wallet_id", null: false
    t.string "payment_hash"
    t.string "payment_request"
    t.string "checking_id"
    t.float "price_in_usd"
    t.integer "price_in_sats"
    t.boolean "paid", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_id"], name: "index_invoices_on_wallet_id"
  end

  create_table "membership_tokens", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "address"
    t.integer "access_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_membership_tokens_on_company_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name"
    t.text "description"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "lnbits_id", null: false
    t.string "lnbits_adminkey"
    t.string "invoice_key"
    t.integer "profit"
    t.integer "loss"
    t.integer "chain", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_wallets_on_company_id"
  end

  add_foreign_key "events", "wallets"
  add_foreign_key "invoices", "wallets"
  add_foreign_key "membership_tokens", "companies"
  add_foreign_key "products", "companies"
  add_foreign_key "wallets", "companies"
end
