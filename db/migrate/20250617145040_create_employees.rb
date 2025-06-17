class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.text :employee_name
      t.references :store, null: false, foreign_key: true
      t.string :position
      t.date :hire_date
      t.date :birth_date
      t.text :phone
      t.text :email

      t.timestamps
    end
  end
end
