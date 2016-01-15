class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post:id])
  	@comments =@post.comments.build(comments_params)
  	@comment.user = current_user
  	@comment.save
  	redirect_to post_path(@post)
  end

  private

  def comment_params
  	params.require(:comment).permit(:content)
end