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
    old_response = Response.find(response.id)
    question = Question.find(response.question_id)
    
    case Question.find(response.question_id).q_type
    when 0 #economic
      self.economic_score = self.economic_score - (old_response.answer) + (response.answer)
    when 1 #social
      self.social_score = self.social_score - (old_response.answer) + (response.answer)
    when 2 #foreign_p
      self.foreign_p_score = self.foreign_p_score - (old_response.answer) + (response.answer)
    end
    save
  end

  def calculate_new_score(response)
    question = Question.find(response.question_id)
    case Question.find(response.question_id).q_type
    when 0 #economic
      self.economic_score = self.economic_score + (response.answer)
      self.economic_response_count += 1
    when 1 #social
      self.social_score = self.social_score + (response.answer)
      self.social_response_count += 1
    when 2 #foreign_p
      self.foreign_p_score = self.foreign_p_score + (response.answer)
      self.foreign_p_response_count += 1
    end
    save
  end


  def economic_result
    if economic_response_count > 3
      25*(self.economic_score/self.economic_response_count)
    else
      "Not enough responses! Answer more economic questions."
    end
  end

  def social_result
     if social_response_count > 3
      25*(self.social_score/self.social_response_count)
    else
      "Not enough responses! Answer more social questions."
    end
  end

  def foreign_p_result
     if foreign_p_response_count > 3
      25*(self.foreign_p_score/self.foreign_p_response_count)
    else
      "Not enough responses! Answer more foreign policy questions."
    end
  end

end
