class CheatFood < ApplicationRecord
  # Direct associations

  belongs_to :foods,
             :class_name => "Food"

  belongs_to :user

  # Indirect associations
  
  has_many :foods_details,
           :through => :food
  has_many :nutrients,
           :through => :food

  # Validations
  
  validates :servings, presence: true, numericality: {greater_than: 0}
  validates :day_of_cheat, presence: true
  
  # These should be hidden associations 
  # FIX LATER
  validates :user_id, presence: true
  validates :foods_id, presence: true

end
