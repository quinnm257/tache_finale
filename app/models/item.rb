class Item < ApplicationRecord
  belongs_to :instrument
  has_many :repairs
  has_many :order_items
end
