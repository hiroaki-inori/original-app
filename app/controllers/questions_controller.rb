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
  end

  def update
  end


  private
  def question_params
    params.require(:question).permit(:title, :category_id, :outline, messages_attributes:[:id, :who_id, :sentence, :_destroy]).merge(user_id: current_user.id)
  end

end
