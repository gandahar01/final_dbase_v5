class User < ApplicationRecord
  # Direct associations

  has_many   :cheat_stats,
             :dependent => :destroy

  has_many   :cheat_foods,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
