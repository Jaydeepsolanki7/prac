class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @posts = Post.all
    render json: @posts, each_serializer: PostSerializer
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.present?
      render json: @post, serializer: PostSerializer
    else
      render json: { error: "Post not found" }
    end
  end

  def new
    @post = Post.new
  end

  def create
    debugger
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render json: {error: "Post can't be created"}
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.present?
      @post.destroy
      render json: { message: "Post succesfully deleted."}, status: 200
    else
      render json: { error: "Post not found" }
    end
  end

  def all_catalogues
    @catalogues = Catalogue.all
    render json: @catalogues
  end

  private

    def post_params
      params.permit(:title, :description)
    end
end
