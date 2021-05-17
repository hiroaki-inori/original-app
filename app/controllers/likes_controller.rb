class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id, comment_id: params[:comment_id])
    @like.save
    @comment = Comment.find_by(id: @like.comment_id)
    @like_count = Like.where(comment_id: @comment_id).count
    # @like_count = Like.where(comment_id: @comment.id).count
    redirect_to question_path(params[:question_id])
  end
end
