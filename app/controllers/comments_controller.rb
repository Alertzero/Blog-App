class CommentsController < ApplicationController
  def create
    set_post
    set_comment
    redirect_to @post, notice: 'Comment was successfully created.'
  end

  def destroy
    set_post
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.friendly.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.create!(params.require(:comment).permit(:name, :comment))
  end

end
