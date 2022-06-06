class CreateItemStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :item_stocks do |t|
      t.references :producto, null: true, index: true, foreign_key: true
      t.integer :cantidad
      t.references :local, null: true, foreign_key: true
      t.references :operacion, null: true, foreign_key: true

      t.timestamps
    end
  end
end
