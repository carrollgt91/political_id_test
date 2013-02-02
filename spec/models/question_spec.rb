require 'spec_helper'

describe Question do
	before do
	 @ques = Question.new(orientation: true, text: "As a means to balance the budget, the government should decrease spending rather than increase taxes.", q_type: 0) 
	 @ques.save
	end

	subject { @ques }

	it { should respond_to(:orientation) }
	it { should respond_to(:text) }
	it { should respond_to(:q_type) }

	it { should be_valid }

	describe "when text is not present" do
		before { @ques.text = "" }
		it { should_not be_valid }
	end	

	describe "when q_type is not present" do
		before { @ques.q_type = nil }
		it { should_not be_valid }
	end
	describe "when orientation is not present" do
		before { @ques.orientation = nil }
		it { should_not be_valid }
	end

	describe "when type is 0" do
		it "should be an economic question" do
			@ques.question_type.should == "Economic"
		end
	end
	describe "when type is 1" do
		before { @ques.q_type = 1 }
		it "should be an social question" do
			@ques.question_type.should == "Social"
		end
	end
	describe "when type is 2" do
		before { @ques.q_type = 2 }
		it "should be an foregin policy question" do
			@ques.question_type.should == "Foreign"
		end
	end

	describe"when orientation is backwards" do
		before { @ques.orientation = false }
		it { should be_valid }
	end




end
