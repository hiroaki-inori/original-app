class CommentLikesController < ApplicationController
  before_action :comment_params

  def create
    comment_like = CommentLike.create(user_id: current_user.id, comment_id: params[:id])
    comment_id = comment_like.comment_id
    user_comment_id = Comment.find(comment_id)
    @user = User.find(user_comment_id.user_id)
    @user.increment!(:like_point, 1)
  end

  def comment_params
    @comment = Comment.find(params[:id])
  end

end
