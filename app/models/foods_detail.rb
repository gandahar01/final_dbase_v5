class FoodsDetail < ApplicationRecord
  # Direct associations

  belongs_to :nutrients,
             :class_name => "Nutrient"

  belongs_to :foods,
             :class_name => "Food"

  # Indirect associations

  # Validations
  validates :foods_details_quantity, presence: true, numericality: {greater_than: 0}
  
  # These should be hidden associations 
  # FIX LATER
  validates :foods_id, presence: true
  validates :nutrients_id, presence: true
end
