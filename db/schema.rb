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

ActiveRecord::Schema.define(version: 2022_06_06_221531) do

  create_table "item_stocks", force: :cascade do |t|
    t.integer "producto_id"
    t.integer "cantidad"
    t.integer "local_id"
    t.integer "operacion_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["local_id"], name: "index_item_stocks_on_local_id"
    t.index ["operacion_id"], name: "index_item_stocks_on_operacion_id"
    t.index ["producto_id"], name: "index_item_stocks_on_producto_id"
  end

  create_table "locals", force: :cascade do |t|
    t.string "nombre"
    t.string "localidad"
    t.string "provincia"
    t.string "tipo_local"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "operacions", force: :cascade do |t|
    t.integer "origen_id", null: false
    t.integer "destino_id", null: false
    t.integer "usuario_id", null: false
    t.datetime "fecha"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "producto_id", null: false
    t.integer "cantidad", null: false
    t.index ["cantidad"], name: "index_operacions_on_cantidad"
    t.index ["destino_id"], name: "index_operacions_on_destino_id"
    t.index ["origen_id"], name: "index_operacions_on_origen_id"
    t.index ["producto_id"], name: "index_operacions_on_producto_id"
    t.index ["usuario_id"], name: "index_operacions_on_usuario_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.string "modelo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nombre"
    t.string "password"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "item_stocks", "locals"
  add_foreign_key "item_stocks", "operacions"
  add_foreign_key "item_stocks", "productos"
  add_foreign_key "operacions", "locals", column: "destino_id"
  add_foreign_key "operacions", "locals", column: "origen_id"
  add_foreign_key "operacions", "productos"
  add_foreign_key "operacions", "usuarios"
end
