class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(params[:comment_id])
    @comment.save
    redirect_to root_path
  end
end
