class CreateRepairs < ActiveRecord::Migration[8.0]
  def change
    create_table :repairs do |t|
      t.references :item, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.date :repair_date
      t.text :description
      t.decimal :price
      t.string :payment_status

      t.timestamps
    end
  end
end
