class User < ActiveRecord::Base
  attr_accessible :email, :name, :oauth_token, :oauth_expires_at, :fb_id, :pic_url

  after_commit :create_result, :on => :create
    

  validates :name, :email, :fb_id, :oauth_token, :oauth_expires_at, :pic_url, presence: true
  validates :name, length: { maximum: 50 }
  validates :email,	uniqueness: { case_sensitive: false }

  has_many :responses
  has_one :result

  def create_result
    result = Result.new(social_score:0, economic_score:0, foreign_p_score:0,social_response_count:0, economic_response_count:0, foreign_p_response_count:0, user_id:self.id)
    result.save
  end


  def self.from_omniauth(auth)
    where({ fb_id:auth[:uid] }).first_or_initialize.tap do |user|
      user.fb_id = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.pic_url = auth.info.image
      user.save!
    end
  end
end
