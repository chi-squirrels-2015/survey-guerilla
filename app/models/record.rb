class Record < ActiveRecord::Base

  belongs_to :survey
  belongs_to :respondent, class_name: "User"
  has_many :responses

  validates :survey, uniqueness: { scope: :respondent}

end
