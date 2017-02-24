class Character < ApplicationRecord
  belongs_to :house
  validates :name
end
