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

ActiveRecord::Schema.define(version: 20200522095516) do

  create_table "cookedstates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", comment: "加工された状態の名前"
    t.bigint "applicant_id", comment: "承認した人のid(管理者id)"
    t.bigint "approver_id", comment: "承認した人のid(管理者id)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_cookedstates_on_applicant_id"
    t.index ["approver_id"], name: "index_cookedstates_on_approver_id"
  end

  create_table "foodcategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false, comment: "食材区分名(肉、野菜、魚、炭水化物など)"
    t.bigint "manager_id", null: false, comment: "申請した人のid(管理者id)"
    t.bigint "approver_id", comment: "承認した人のid(管理者id)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approver_id"], name: "index_foodcategories_on_approver_id"
    t.index ["manager_id"], name: "index_foodcategories_on_manager_id"
  end

  create_table "ingredients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false, comment: "部位の名称"
    t.bigint "applicant_id", comment: "承認した人のid(管理者id)"
    t.bigint "approver_id", comment: "承認した人のid(管理者id)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_ingredients_on_applicant_id"
    t.index ["approver_id"], name: "index_ingredients_on_approver_id"
  end

  create_table "managers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_managers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_managers_on_unlock_token", unique: true
  end

  create_table "nutrients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "lipid", comment: "脂質"
    t.integer "carbonhydrate", comment: "炭水化物"
    t.integer "protein", comment: "タンパク質"
    t.integer "vit_a", comment: "ビタミンA"
    t.integer "vit_d", comment: "ビタミンD"
    t.integer "vit_e", comment: "ビタミンE"
    t.integer "vit_k", comment: "ビタミンK"
    t.integer "vit_b1", comment: "ビタミンB1"
    t.integer "vit_b2", comment: "ビタミンB2"
    t.integer "vit_b6", comment: "ビタミンB6"
    t.integer "vit_12", comment: "ビタミンB12"
    t.integer "vit_c", comment: "ビタミンC"
    t.integer "potassium", comment: "カリウム"
    t.integer "calcium", comment: "カルシウム"
    t.integer "magnesium", comment: "マグネシウム"
    t.integer "phosphorus", comment: "リン"
    t.integer "iron", comment: "鉄"
    t.integer "zinc", comment: "亜鉛"
    t.integer "copper", comment: "銅"
    t.integer "manganese", comment: "マンガン"
    t.integer "beta_carotene", comment: "βカロテン"
    t.integer "niacin", comment: "ナイアシン"
    t.integer "folic_acid", comment: "葉酸"
    t.integer "pantothenic_acid", comment: "パントテン酸"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rawmaterials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false, comment: "原材料名"
    t.integer "min_quantity", null: false, comment: "原材料最小数量"
    t.bigint "applicant_id", comment: "承認した人のid(管理者id)"
    t.bigint "approver_id", comment: "承認した人のid(管理者id)"
    t.bigint "foodcategory_id"
    t.bigint "nutrient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_rawmaterials_on_applicant_id"
    t.index ["approver_id"], name: "index_rawmaterials_on_approver_id"
    t.index ["foodcategory_id"], name: "index_rawmaterials_on_foodcategory_id"
    t.index ["nutrient_id"], name: "index_rawmaterials_on_nutrient_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nickname"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "cookedstates", "managers", column: "applicant_id"
  add_foreign_key "cookedstates", "managers", column: "approver_id"
  add_foreign_key "foodcategories", "managers"
  add_foreign_key "foodcategories", "managers", column: "approver_id"
  add_foreign_key "ingredients", "managers", column: "applicant_id"
  add_foreign_key "ingredients", "managers", column: "approver_id"
  add_foreign_key "rawmaterials", "managers", column: "applicant_id"
  add_foreign_key "rawmaterials", "managers", column: "approver_id"
end
