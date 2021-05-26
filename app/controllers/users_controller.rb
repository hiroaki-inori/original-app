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

  def destroy
    @user.destroy
    redirect_to root_path
  end

  # def del
  #   @user = User.find(params[:id])
  #   @comment = @user.comments.includes(:user)
  #     num = 0
  #     @commetn.ids.each do |num|



  #   @question = @user.questions.includes(:user)
  #   @comment_likes = @user.comment_likes.includes(:user)
    
  #   binding.pry
  #   # @user.destroy
  #   redirect_to root_path
  # end

end
