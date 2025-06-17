class Instrument < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :category
end
