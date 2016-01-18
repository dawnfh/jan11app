class CommentsController < ApplicationController
  
  # def comment
  #   Post.find(params[:id]).comments.create (params[:comments])
  #   flash[:notice] = "Comment added."
  #   redirect_to :action => 'show', :d => params[:id]
  # end

  def create
  	@post = Post.find(params[:post_id])
  	@comments =@post.comments.build(comment_params)
  	@comment.user = current_user
  	@comment.save
  	redirect_to post_path(@post)
  end

  private

  def comment_params
  	params.require(:comment).permit(:content)
  end
end
