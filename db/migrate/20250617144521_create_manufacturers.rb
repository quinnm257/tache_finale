class CreateManufacturers < ActiveRecord::Migration[8.0]
  def change
    create_table :manufacturers do |t|
      t.string :manufacturer_name
      t.references :country, null: false, foreign_key: true
      t.text :email

      t.timestamps
    end
  end
end
