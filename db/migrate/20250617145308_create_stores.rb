class CreateStores < ActiveRecord::Migration[8.0]
  def change
    create_table :stores do |t|
      t.text :store_name
      t.text :address
      t.text :phone
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
