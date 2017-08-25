class Nutrient < ApplicationRecord
  # Direct associations

  has_many   :foods_details,
             :foreign_key => "nutrients_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :foods,
             :through => :foods_details,
             :source => :foods

  has_many   :cheat_foods,
             :through => :foods,
             :source => :cheat_foods

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
  validates :nutrients_unit_of_measure, presence: true

end
