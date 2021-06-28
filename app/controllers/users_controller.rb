class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @questions = Question.all
    @my_questions = @user.questions.includes(:user)
    comments = @user.comments.includes(:user)
    @comment_questions = @questions.find(comments.pluck(:question_id))
    @comment_questions_count = @comment_questions.count  
  end

  def edit
  end

  def update
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def change
    @user = User.find(params[:id])  
  end

end
