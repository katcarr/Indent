class PostsController< ApplicationController
  def new
    @post = Post.new
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post successfully updated!"
      redirect_to post_path(@post)
    else
      render :edit
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all

  end

  def create
    @post = Post.new(post_params)
    @post.date = Date.today
    if @post.save
      flash[:notice] = "Post posted"
      redirect_to posts_path
    else
      flash[:alert] = "There was a problem submitting your post"
      redirect_to :back
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "Post deleted"
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end



end
