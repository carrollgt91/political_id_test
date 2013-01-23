class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def destroy
    q = Question.find(params[:id])
    q.delete
  end

  def show
    @ques = Question.find(params[:id])
  end
end
