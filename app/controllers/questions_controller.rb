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

  def respond
    qid = params[:question_id].to_i
    question = Question.find(qid)

    response = Response.find_or_create_by_user_id_and_question_id(current_user.id, qid)
    answer = question.orientation ? params[:answer] : 3 - params[:answer]
    
    response.answer = answer.to_i

    if(response.save && Question.find(qid).next)
      redirect_to question.next
    else
      redirect_to question
    end
  end

  def show
    @ques = Question.find(params[:id])
    @response = Response.find_by_user_id_and_question_id(current_user.id, @ques.id) if current_user
  end
  
end
