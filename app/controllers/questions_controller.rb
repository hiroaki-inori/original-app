class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @questions = Question.all
    @users = User.all
  end

  def new
    @question = Question.new
    @messages = @question.messages.build
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
    @messages = @question.messages.includes(:question)
    @comments = @question.comments.includes(:user)
    @comment = Comment.new
    @comment_num = 0
  end

  def edit
    @question = Question.find(params[:id])
    unless current_user.id == @question.user_id
      redirect_to action: :index
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path
    else
      render :edit
    end
  end

  def close_btn

  end

  def close
    question = Question.find(params[:id])
    question.close = true
    question.save
    redirect_to root_path
  end


  private
  def question_params
    params.require(:question).permit(:title, :category_id, :outline, messages_attributes:[:id, :who_id, :sentence, :_destroy]).merge(user_id: current_user.id)
  end

end
