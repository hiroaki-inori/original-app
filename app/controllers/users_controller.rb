class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @comments = @user.comments.includes(:user)
    @like_count = CommentLike.where(comment_id: @comments.ids).count
  end

  def edit
  end

  def update
  end

end
