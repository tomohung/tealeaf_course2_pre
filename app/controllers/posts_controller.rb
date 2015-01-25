class PostsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to user_path(@user)
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @user, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end  

private
  def post_params
      params.require(:post).permit(:title, :body)
  end

end

