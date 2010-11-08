class HomeController < ApplicationController
  def index    
    @post = Post.new
    @comment = Comment.new
  end
end
