class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question_message = QuestionMessage.new
  end

  def create
    @question_message = QuestionMessage.new(question_params)
    if @question_message.valid?
       @question_message.save
       redirect_to root_path
    else
      render :new
    end 
  end

  def show
    @question = Question.find(params[:id])
    @comments = @question.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end

  def update
  end


  private
  def question_params
    params.require(:question_message).permit(:title, :category_id, :outline, :who_id, :sentence, :content).merge(user_id: current_user.id)
  end

end
