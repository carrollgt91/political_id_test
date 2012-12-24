require 'spec_helper'

describe Result do
	before { @result = Result.new(economic_score: 50, social_score: 100, foreign_p_score: 0) }

	subject { @result }

	it { should respond_to(:economic_score) }
	it { should respond_to(:social_score) }
	it { should respond_to(:foreign_p_score) }

	it { should be_valid }

	describe "when a score is not present" do
		before { @result.economic_score = nil }
		it { should_not be_valid }
	end

end
