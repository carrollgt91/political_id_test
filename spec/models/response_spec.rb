require 'spec_helper'

describe Response do

	let(:user) { FactoryGirl.create(:user) }
	let(:question) { FactoryGirl.create(:question) }

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
end
