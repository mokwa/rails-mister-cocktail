class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true
  validates_uniqueness_of :name
end
