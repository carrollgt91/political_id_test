class UsersController < ApplicationController
  def create
  end

  def show
  	unless(current_user)
  		redirect_to root_url
  	end
  end

  def delete
  end

  def edit
  end
end
