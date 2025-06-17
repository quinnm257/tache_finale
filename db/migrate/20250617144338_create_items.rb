class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.references :instrument, null: false, foreign_key: true
      t.text :serial_number
      t.text :description
      t.text :condition
      t.integer :production_year
      t.decimal :price

      t.timestamps
    end
  end
end
