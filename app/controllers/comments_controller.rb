class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    # @user = @comment.user
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to question_path(@comment.question)
    else
      @question = @comment.question
      @comments = @question.comments.includes(:user)
      @messages = @question.messages.includes(:question)
      render "questions/show"
    end
    # if @comment.save
    #   ActionCable.server.broadcast 'comment_channel', comment: @comment, user: @user
    # end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end
