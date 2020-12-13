class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :destroy]

  def show; end

  def new
    @post = Post.new
    @post.build_category
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render 'new'
    end
  end

  def destroy
    @post.destroy
    redirect_to categories_path, notice: 'Post was successfully destroyed.'
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:text,
                                 :category_id,
                                 category_attributes: [:title])
  end
end
