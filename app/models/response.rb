class Response < ActiveRecord::Base
  attr_accessible :answer

  belongs_to :user
  belongs_to :question

  validates :answer, :user_id, :question_id, presence: true

end
