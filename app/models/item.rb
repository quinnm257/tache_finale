class Item < ApplicationRecord
  belongs_to :instrument
  belongs_to :manufacturer
  has_many :repairs
  has_many :order_items
end
