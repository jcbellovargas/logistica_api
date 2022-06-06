class CreateLocals < ActiveRecord::Migration[6.1]
  def change
    create_table :locals do |t|
      t.string :nombre
      t.string :localidad
      t.string :provincia
      t.string :tipo_local

      t.timestamps
    end
  end
end
