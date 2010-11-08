class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(params[:post_id])
    @post.save
    redirect_to root_path
  end
end
