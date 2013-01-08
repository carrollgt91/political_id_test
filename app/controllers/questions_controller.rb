class QuestionsController < ApplicationController
  def new
  end

  def show
  	@ques = Question.find(params[:id])
  end

  def edit
  end
end
