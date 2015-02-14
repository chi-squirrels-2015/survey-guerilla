class User < ActiveRecord::Base

  has_secure_password

  has_many :surveys
  has_many :records
  has_many :questions, through: :surveys

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
