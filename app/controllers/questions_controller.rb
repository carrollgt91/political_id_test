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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if(@question.update_attributes(params[:question]))
      redirect_to @question
    else
      render 'edit'
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
