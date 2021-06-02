class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @questions = Question.all
    @comments = @user.comments.includes(:user)
    # @like_count = CommentLike.where(comment_id: @comments.ids).count
    @my_questions = @user.questions.includes(:user)
    @comment_questions = @questions.find(@comments.pluck(:question_id))
    @comment_questions_count = @comment_questions.count
    # binding.pry
  end

  def edit
  end

  def update
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

end
