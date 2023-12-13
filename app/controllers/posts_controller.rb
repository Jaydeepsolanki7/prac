class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts, each_serializer: PostSerializer
  end
end
