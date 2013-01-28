class Result < ActiveRecord::Base
	
  attr_accessible :economic_score, :foreign_p_score, :social_score, :user_id
  validates :economic_score, :foreign_p_score, :social_score, :user_id, :presence => true
  
  belongs_to :user

  def calculate_score
  	
  end

end
