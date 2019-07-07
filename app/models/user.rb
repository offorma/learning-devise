class User < ApplicationRecord

  attr_accessor :signin
  validates :phone, uniqueness: true, numericality: { only_integer: true }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  where(conditions).where(["phone = :value OR lower(email)
  = :value", { :value => signin.downcase }]).first
  end
end
