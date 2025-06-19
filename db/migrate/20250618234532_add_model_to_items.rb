class AddModelToItems < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :model, :string
  end
end
