FactoryGirl.define do
  factory :user do
    name     "Sample User"
    email    "sample@example.com"
  end

  factory :question do
  	text 					"As a means to balance the budget, the government should decrease spending rather than increase taxes."
  	orientation 	true
  	q_type  			0
  end
end