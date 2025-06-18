class Country < ApplicationRecord
	has_many :stores
	has_many :manufacturers
	has_many :customers
end
