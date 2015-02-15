class User < ActiveRecord::Base

  has_secure_password

  has_many :surveys, foreign_key: :creator_id
  has_many :records, foreign_key: :respondent_id
  has_many :questions, through: :surveys

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
