class FoodsDetail < ApplicationRecord
  # Direct associations

  belongs_to :foods,
             :class_name => "Food"

  # Indirect associations

  # Validations

end
