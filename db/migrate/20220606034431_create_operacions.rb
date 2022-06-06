class CreateOperacions < ActiveRecord::Migration[6.1]
  def change
    create_table :operacions do |t|
      t.references :origen, null: false, index: true, foreign_key: { to_table: :locals }
      t.references :destino, null: false, index: true, foreign_key: { to_table: :locals }
      t.references :producto, null: false, index: true, foreign_key: true
      t.integer :cantidad, null: false, index: true, 
      t.references :usuario, null: false, index: true, foreign_key: true
      t.timestamp :fecha

      t.timestamps
    end
  end
end
