require 'spec_helper'

describe Result do
	let(:user) { FactoryGirl.create(:user) }
	before do 
		@result = Result.new(economic_score: 0, social_score: 0, foreign_p_score: 0, user_id:user.id)
		@result.economic_response_count = 0
		@result.social_response_count = 0
		@result.foreign_p_response_count = 0
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
	describe "when a response count is not present" do
		before { @result.social_response_count = nil }
		it { should_not be_valid }
	end
	describe "when a result is not associated with a user" do
		before { @result.user_id = nil }
		it { should_not be_valid }
	end

	describe "when the user hasn't answered enough questions" do
		it "should return a string for the result" do
			@result.economic_result.should eq("Not enough responses! Answer more economic questions.")
		end
	end

	describe "when the use has answered enough questions" do
		before do
			@result.economic_response_count = 5 
			@result.economic_score = 11
		end

		it "should calculate the correct score" do
			@result.economic_result.should eq(50)
		end
	end

end
