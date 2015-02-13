class Survey < ActiveRecord::Base

  belongs_to :user
  has_many :records
  has_many :respondents, through: :records, source: :user
  has_many :questions
  has_many :answers, through: :questions

  validates :title, presence: true
end
