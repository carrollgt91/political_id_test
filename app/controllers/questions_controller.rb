require 'pry'
class QuestionsController < ApplicationController
  def new
  end

  def show
  	binding.pry
  	@ques = Question.find(params[:id])

  end

  def edit
  end
end
