class MoveManufacturerToItems < ActiveRecord::Migration[8.0]
  def change
    add_reference :items, :manufacturer, null: false, foreign_key: true
    remove_reference :instruments, :manufacturer, foreign_key: true
  end
end
