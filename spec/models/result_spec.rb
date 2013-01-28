require 'spec_helper'

describe Result do
	let(:user) { FactoryGirl.create(:user) }
	before do 
		@result = Result.new(economic_score: 50, social_score: 100, foreign_p_score: 0, user_id:user.id)
		@result.economic_response_count = 10
		@result.social_response_count = 10
		@result.foreign_p_response_count = 10
	end

	subject { @result }

	it { should respond_to(:economic_score) }
	it { should respond_to(:social_score) }
	it { should respond_to(:foreign_p_score) }

	it { should be_valid }

	describe "when a score is not present" do
		before { @result.economic_score = nil }
		it { should_not be_valid }
	end

	describe "when a result is not associated with a user" do
		before { @result.user_id = nil }
		it { should_not be_valid }
	end

end
