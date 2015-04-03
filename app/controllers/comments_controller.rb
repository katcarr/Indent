class CommentsController<ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if current_user
      @comment.user_id = current_user.id
    end

    if @comment.save
     flash[:notice] = "Comment added"
    else
     flash[:alert] = "Something went wrong when commenting"
    end

    response do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def show

  end


  def destroy

  end

  private
  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
