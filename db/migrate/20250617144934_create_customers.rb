class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.text :customer_name
      t.text :email
      t.text :phone
      t.text :delivery_address
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
