class User < ActiveRecord::Base

  has_many :surveys
  has_many :taken_surveys
  has_many :questions, through: :surveys

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
