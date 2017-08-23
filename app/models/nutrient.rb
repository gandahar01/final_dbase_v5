class Nutrient < ApplicationRecord
  # Direct associations

  has_many   :foods_details,
             :foreign_key => "nutrients_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
