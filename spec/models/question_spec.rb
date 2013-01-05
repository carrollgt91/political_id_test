require 'spec_helper'

describe Question do
	before { @ques = Question.new(orientation: true, text: "Test Question", type: 0) }

	subject { @ques }

	it { should respond_to(:orientation) }
	it { should respond_to(:text) }
	it { should respond_to(:type) }

	describe "when type is 0" do
		it "should be an economic question" do
			@ques.question_type.should == "Economic"
		end
	end

end
