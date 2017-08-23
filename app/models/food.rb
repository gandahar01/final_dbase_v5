class Food < ApplicationRecord
  # Direct associations

  has_many   :cheat_foods,
             :foreign_key => "foods_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
