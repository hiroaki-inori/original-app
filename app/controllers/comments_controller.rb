class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to question_path(@comment.question)
    else
      @question = @comment.question
      @comments = @question.comments.includes(:user)
      @messages = @question.messages.includes(:question)
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end
