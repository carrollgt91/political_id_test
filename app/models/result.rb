class Result < ActiveRecord::Base
  attr_accessible :economic_score, :foreign_p_score, :social_score
  validates :economic_score, :foreign_p_score, :social_score, :presence => true
end
