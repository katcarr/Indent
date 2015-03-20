class PostsController< ApplicationController
  def new
  end

  def index
    @posts = Post.all

  end

  def create
    @post = Post.new(post_params)
    @post.date = Date.new
    if @post.save
      flash[:notice] = "Post posted"
      redirect_to posts_path
    else
      flash[:alert] = "There was a problem submitting your post"
      redirect_to :back
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
