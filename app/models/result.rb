class Result < ActiveRecord::Base
	
  attr_accessible :economic_score, :foreign_p_score, :social_score, :user_id, :economic_response_count, :foreign_p_response_count, :social_response_count
  validates :economic_score, :foreign_p_score, :social_score, :user_id, :economic_response_count, :foreign_p_response_count, :social_response_count, :presence => true
  
  belongs_to :user

  def calculate_score(response)
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
      self.economic_score = self.economic_score - (sign*old_response.answer) + (sign*response.answer)
    when 1 #social
      self.social_score = self.social_score - (sign*old_response.answer) + (sign*response.answer)
    when 2 #foreign_p
      self.foreign_p_score = self.foreign_p_score - (sign*old_response.answer) + (sign*response.answer)
    end
  end

  def calculate_new_score(response)
    question = Question.find(response.question_id)
    sign = question.orientation ? 1 : -1

    case Question.find(response.question_id).q_type
    when 0 #economic
      self.economic_score = self.economic_score + (sign*response.answer)
    when 1 #social
      self.social_score = self.social_score + (sign*response.answer)
    when 2 #foreign_p
      self.foreign_p_score = self.foreign_p_score + (sign*response.answer)
    end
  end


  def economic_result
    if economic_response_count > 3
      self.economic_score/self.economic_response_count 
    else
      "Not enough responses! Answer more economic questions."
    end
  end

  def social_result
     if social_response_count > 3
      self.social_score/self.social_response_count 
    else
      "Not enough responses! Answer more social questions."
    end
  end

  def foreign_p_result
     if foreign_p_response_count > 3
      self.foreign_p_score/self.foreign_p_response_count 
    else
      "Not enough responses! Answer more foreign policy questions."
    end
  end

end
