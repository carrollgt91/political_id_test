class Result < ActiveRecord::Base
	
  attr_accessible :economic_score, :foreign_p_score, :social_score, :user_id, :economic_response_count, :foreign_p_response_count, :social_response_count
  validates :economic_score, :foreign_p_score, :social_score, :user_id, :economic_response_count, :foreign_p_response_count, :social_response_count, :presence => true
  
  belongs_to :user

  def calculate_score(response)
  	case Question.find(response.question_id).q_type
  	when 0 #economic
		when 1 #social
		when 2 #foreign_p
  	end
  end

end
