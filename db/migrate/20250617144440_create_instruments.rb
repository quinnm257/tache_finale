class CreateInstruments < ActiveRecord::Migration[8.0]
  def change
    create_table :instruments do |t|
      t.text :instrument_name
      t.references :manufacturer, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
