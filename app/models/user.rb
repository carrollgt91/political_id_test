class User < ActiveRecord::Base
  attr_accessible :email, :name, :oauth_token, :oauth_expires_at, :fb_id, :pic_url
  validates :name, :email, :fb_id, :oauth_token, :pic_url, presence: true
  validates :name, length: { maximum: 50 }
  validates :email,	uniqueness: { case_sensitive: false }



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
