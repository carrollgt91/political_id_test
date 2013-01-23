class Question < ActiveRecord::Base
  attr_accessible :orientation, :text, :q_type
  validates :text, :q_type, :orientation, presence: true

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

  def self.to_q_type(type)
    case type
    when "Economic"
      return 0
    when "Social"
      return 1
    when "Foreign"
      return 2
    end
  end
  
  def previous
    Question.where(["id < ?", id]).last
  end

  def next
    Question.where(["id > ?", id]).first
  end

end
