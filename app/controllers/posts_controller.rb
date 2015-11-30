class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    @post.dog_id = params[:user_id]
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = params[:user_id]
  		if @post.save
  			redirect_to @post.user, notice: "Created new post."
  		else
  			render :new
  		end
  end

  def update
    if @post.update(post_params)
      redirect_to [@post.user, @post], notice: "Updated post successfully."
    else
      render :edit 
    end
  end

  def destroy
    @post.destroy
    redirect_to user_statuses_url(@post.user), notice: 'Successfully deleted post.'
  end

private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end
end
