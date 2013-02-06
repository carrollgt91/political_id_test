FactoryGirl.define do
	
  factory :result, class: Result do
    social_score 10
    economic_score 10
    foreign_p_score 10

    economic_response_count  3
    social_response_count 5
    foreign_p_response_count 4

    user
  end
  factory :user do
    name     				"Beni Hana"
    email    				"benihana1011@gmail.com"
    fb_id						"100005072196289"
    pic_url					"http://graph.facebook.com/100005072196289/picture?type=square"
    oauth_token			"test_token"
    oauth_expires_at { Date.new.next_week }

    factory :user_with_result do
      ignore do
        responses_count 1
      end

      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:result, evaluator.responses_count, user: user)
      end
    end

  end

  factory :question do
    ignore do
      type      rand(1..3)
      orient [true,false].sample
    end

  	text 					"As a means to balance the budget, the government should decrease spending rather than increase taxes."
    orientation { orient }
    q_type { type }

  end

  factory :response do
    user
    result
    question
    answer
  end

end