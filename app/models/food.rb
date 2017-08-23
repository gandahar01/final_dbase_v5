class Food < ApplicationRecord
  # Direct associations

  has_many   :foods_details,
             :foreign_key => "foods_id",
             :dependent => :destroy

  has_many   :cheat_foods,
             :foreign_key => "foods_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :nutrients,
             :through => :foods_details,
             :source => :nutrients

  has_many   :users,
             :through => :cheat_foods,
             :source => :user

  # Validations

end
