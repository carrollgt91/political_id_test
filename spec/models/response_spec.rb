require 'spec_helper'

describe Response do

	let(:user) { FactoryGirl.create(:user_with_result) }
	let(:question) { FactoryGirl.create(:question, :type => 2, :orient => true) }


	before do
	 @response = Response.new
	 @response.answer = 3
	 @response.user_id = user.id
	 @response.question_id = question.id
	 @response.save
	end

	subject { @response }

	it { should respond_to(:answer) }
	it { should respond_to(:user_id) }
	it { should respond_to(:question_id) }

	it { should be_valid }

	describe "when answer is not present" do
		before { @response.answer = "" }
		it { should_not be_valid }
	end	

	describe "when question_id is not present" do
		before { @response.question_id = nil }
		it { should_not be_valid }
	end	

	describe "when user_id is not present" do
		before { @response.user_id = nil }
		it { should_not be_valid }
	end	

	describe "when answer is greater than 3" do
		before { @response.answer = 4 }
		it { should_not be_valid }
	end
	describe "when answer is less than 0" do
		before { @response.answer = -1 }
		it { should_not be_valid }
	end
end
