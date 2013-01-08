require 'spec_helper'

describe 'Question pages' do
	
	subject { page }

	describe "answer question page" do
		let(:question) { FactoryGirl.create(:question) }
		before { visit question_path(question) }

		it { should have_selector('h2', text: question.text) }


	end

end