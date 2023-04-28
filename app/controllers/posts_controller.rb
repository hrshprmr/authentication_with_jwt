class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end 

  def create
    @post = Post.new(post_params)
  
    if @post.save
      render json: { message: 'Post created successfully.' }
    else
      render json: { errors: @post.errors.full_messages }, status:
       :unprocessable_entity
    end
  end

  def index
    @posts = Post.all
    render json: @posts
  end

  private

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: @current_user.id)
  end
end
