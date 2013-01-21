require 'spec_helper'

describe User do
	before { @user = User.new(name: "Sample User", email:"test@example.com", oauth_token: "12345", fb_id: "12345", pic_url: "https://sphotos-a.xx.fbcdn.net/hphotos-ash4/430883_10151367037281294_116949034_n.jpg" ) }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }

	it { should be_valid }

	describe "when name is not present" do
		before { @user.name = "" }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = "" }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @user.name = "a"*51 }
		it { should_not be_valid }
	end

	describe "when oauth_token is not present" do
		before { @user.oauth_token = "" }
		it { should_not be_valid }
	end

	describe "when fb_id is not present" do
		before { @user.fb_id = "" }
		it { should_not be_valid }
	end

	describe "when email format is valid" do
		
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				@user.should be_valid
			end

		end
	end

	describe "When email is already taken"	do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email.upcase!
			user_with_same_email.save
		end

		it { should_not be_valid }

	end
end