class Question < ActiveRecord::Base
  attr_accessible :orientation, :text, :q_type

  def question_type
  	case q_type
  	when 0
  		return "Economic"
  	when 1
  		return "Social"
  	when 2
  		return "Foreign"
  	end
  end
  
end
