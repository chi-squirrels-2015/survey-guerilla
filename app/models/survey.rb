class Survey < ActiveRecord::Base

  belongs_to :user
  has_many :taken_surveys
  has_many :respondents, through: :taken_surveys, source: :user
  has_many :questions
  has_many :answers, through: :questions

  validates :title, presence: true
end
