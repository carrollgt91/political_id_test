class User < ActiveRecord::Base
  attr_accessible :email, :name
  validates :name, :email, presence: true
  validates :name, length: { maximum: 50 }
end
