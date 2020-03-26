class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)

    if @post.save 
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params) 
      redirect_to @post
    else
      render :edit
    end
  end

  def likes #PUT route 
    # byebug
    @post = Post.find(params[:post_id])

    @post.increment!(:likes) #increases integer attribute by 1 
                             #! saves the changes for the redirect_to

    redirect_to @post
  end

  private 

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end
end
