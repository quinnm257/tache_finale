class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.date :order_date
      t.date :delivery_date
      t.string :payment_status
      t.string :delivery_status
      t.decimal :total_price

      t.timestamps
    end
  end
end
