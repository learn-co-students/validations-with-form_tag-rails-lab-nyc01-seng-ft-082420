class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.is_valid?
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      @errors = @post.errors.full_messages
      redirect_to edit_post_path(@post)
    end
  end

  def new
    @post = Post.find(params[:id])
  
  end

  def create
    @post = Post.create(post_params)

    if @post.is_valid?
      redirect_to post_path(@post)
    else
      @errors = @post.errors.full_messages
      redirect_to new_post_path(@post)
    end
      
  
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
