class Response < ActiveRecord::Base
  attr_accessible :answer

  belongs_to :user
  belongs_to :question

  validates :answer, :user_id, :question_id, presence: true

  def string_answer
  	case answer
  	when 0
  		return "Strongly Disgree"
  	when 1
  		return "Disagree"
  	when 2
  		return "Agree"
  	when 3
  		return "Strongly Agree"
  	end
  end

end
