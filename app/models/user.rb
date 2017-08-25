class User < ApplicationRecord
  # Direct associations

  has_many   :cheat_stats,
             :dependent => :destroy

  has_many   :cheat_foods,
             :dependent => :destroy

  # Indirect associations

  has_many   :foods,
             :through => :cheat_foods,
             :source => :foods

  # Validations
  validates :email, :presence => true, :uniqueness => true
  validates :age, :presence => true, numericality: {greater_than: 2}, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  validates :gender, :presence => true
  validates :activity_level, :presence => true
  validates_format_of :email,:with => Devise::email_regexp

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
