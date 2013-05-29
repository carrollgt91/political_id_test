class StaticPagesController < ApplicationController
  def home
  	if(current_user)
  		redirect_to profile_url
  	end
  end

  def help
  end
end
