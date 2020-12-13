class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :destroy]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.build_category
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render 'new'
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to categories_path, notice: 'Post was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:text, :category_id, category_attributes: [:title])
  end
end
