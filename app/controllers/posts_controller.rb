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

  #  PATCH route
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params) 
      redirect_to @post
    else
      render :edit
    end
  end

  # PATCH route
  def likes
    # can use params[:id] syntax to find targeted post object because 
    # of the on: :member option in route definition
    # without on: :member option, syntax would be params[:post_id]
    @post = Post.find(params[:id])

    @post.increment!(:likes) # increases an integer data type attribute by 1 
                             # ! saves the changes for the redirect_to

    redirect_to @post
  end

  private 

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end
end
