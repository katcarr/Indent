class CommentsController<ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(comment_params)
    if comment.save
     flash[:notice] = "Comment added"
     redirect_to :back
   else
     flash[:alert] = "Something went wrong when commenting"
     redirect_to :back
    end
  end

  def new

  end

  def show

  end

  private
  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
