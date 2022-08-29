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

ActiveRecord::Schema[7.0].define(version: 2022_08_29_201132) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educational_institutions", force: :cascade do |t|
    t.text "name"
    t.text "cnpj"
    t.text "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.decimal "invoice_amount"
    t.date "due_date"
    t.text "status"
    t.integer "registration_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.decimal "amount"
    t.integer "invoice_quantity"
    t.integer "expiration_day"
    t.text "course_name"
    t.integer "educational_institution_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.text "name"
    t.text "cpf"
    t.date "birth_date"
    t.integer "cell"
    t.text "genre"
    t.text "form_of_payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
