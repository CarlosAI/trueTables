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

ActiveRecord::Schema.define(version: 20190206191914) do

  create_table "basic_tables", force: :cascade do |t|
    t.boolean "p"
    t.boolean "q"
    t.boolean "r"
    t.boolean "s"
    t.integer "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "expresion"
    t.string "parte1"
    t.string "parte2"
    t.string "parte3"
    t.string "parte4"
    t.string "parte5"
    t.string "parte6"
    t.boolean "res_parte1"
    t.boolean "res_parte2"
    t.boolean "res_parte3"
    t.boolean "res_parte4"
    t.boolean "res_parte5"
    t.boolean "res_parte6"
  end

  create_table "cars", force: :cascade do |t|
    t.string "nombre"
    t.string "modelo"
    t.integer "anho"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
  end

  create_table "cities", force: :cascade do |t|
    t.string "nombre"
    t.integer "poblacion"
    t.string "pais"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre_empleado"
  end

  create_table "items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
