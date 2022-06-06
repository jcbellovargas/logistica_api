class ChangeOperations < ActiveRecord::Migration[6.1]
  def change
    change_table :operacions do |t|
      t.references :producto, null: false, index: true, foreign_key: true
      t.integer :cantidad, null: false, index: true
    end
  end
end
