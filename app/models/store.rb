class Store < ApplicationRecord
  belongs_to :country
  has_many :employees
end
