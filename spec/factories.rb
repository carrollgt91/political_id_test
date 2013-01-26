FactoryGirl.define do
	
  factory :user do
    name     				"Beni Hana"
    email    				"benihana1011@gmail.com"
    fb_id						"100005072196289"
    pic_url					"http://graph.facebook.com/100005072196289/picture?type=square"
    oauth_token			"test_token"
    oauth_expires_at { Date.new.next_week }
  end

  factory :question do
  	text 					"As a means to balance the budget, the government should decrease spending rather than increase taxes."
  	orientation 	true
  	q_type  			0
  end

end