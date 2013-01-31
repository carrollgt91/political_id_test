class Result < ActiveRecord::Base
	
  attr_accessible :economic_score, :foreign_p_score, :social_score, :user_id, :economic_response_count, :foreign_p_response_count, :social_response_count
  validates :economic_score, :foreign_p_score, :social_score, :user_id, :economic_response_count, :foreign_p_response_count, :social_response_count, :presence => true
  
  belongs_to :user

  def calculate_score(response)
    binding.pry
    if(response.id)
      recalculate_score(response)
    else
      calculate_new_score(response)
    end
  end


  def recalculate_score(response)
    old_response = response.user.responses(response.id)
    question = Question.find(response.question_id)
    sign = question.orientation ? 1 : -1

    case Question.find(response.question_id).q_type
    when 0 #economic
      economic_score = economic_score - (sign*old_response.answer) + (sign*response.answer)
    when 1 #social
      social_score = social_score - (sign*old_response.answer) + (sign*response.answer)
    when 2 #foreign_p
      foreign_p_score = foreign_p_score - (sign*old_response.answer) + (sign*response.answer)
    end
  end

  def calculate_new_score(response)
    question = Question.find(response.question_id)
    sign = question.orientation ? 1 : -1

    case Question.find(response.question_id).q_type
    when 0 #economic
      economic_score = economic_score + (sign*response.answer)
    when 1 #social
      social_score = social_score + (sign*response.answer)
    when 2 #foreign_p
      foreign_p_score = foreign_p_score + (sign*response.answer)
    end
  end
end
