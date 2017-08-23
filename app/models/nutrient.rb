class Nutrient < ApplicationRecord
  # Direct associations

  has_many   :foods_details,
             :foreign_key => "nutrients_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :cheat_foods,
             :through => :foods,
             :source => :cheat_foods

  # Validations

end
