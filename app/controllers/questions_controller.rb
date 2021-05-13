class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    if @question.save
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
    params.require(:question).permit(:title, :category_id, :outline, :content).merge(user_id: current_user.id)
  end

end
