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

  def next

    qid = params[:question_id].to_i

    response = Response.find_or_create_by_user_id_and_question_id(current_user.id, qid)

    response.answer = params[:answer]

    if(response.save)
      redirect_to Question.find(qid+1)
    else
      render Question.find(qid)
    end
  end

  def show
    @ques = Question.find(params[:id])
  end
end
