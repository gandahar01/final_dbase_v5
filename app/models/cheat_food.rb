class CheatFood < ApplicationRecord
  # Direct associations

  belongs_to :foods,
             :class_name => "Food"

  belongs_to :user

  # Indirect associations

  has_one    :nutrient,
             :through => :foods,
             :source => :nutrients

  # Validations

end
