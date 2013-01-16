require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Political ID Test'" do
      visit '/static_pages/home'
      page.should have_content('Political ID Test')
    end

    it "should have the right title" do
    	visit '/static_pages/home'
    	page.should have_selector('title', text:'Political ID Test | Home')
    end
  end
end