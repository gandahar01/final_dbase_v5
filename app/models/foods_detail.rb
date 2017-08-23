class FoodsDetail < ApplicationRecord
  # Direct associations

  belongs_to :nutrients,
             :class_name => "Nutrient"

  belongs_to :foods,
             :class_name => "Food"

  # Indirect associations

  # Validations

end
