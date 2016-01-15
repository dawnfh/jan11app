class PostsController < ApplicationController
	def index
		# @post = current_user.posts.build
		@posts = Post.all
	end

	def comment
		Post.find(params[:id]).comments.create (params[:comments])
		flash[:notice] = "Comment added."
		redirect_to :action => 'show', :d => params[:id]
	end

	def create
		@post = current.user.post.build
		if @post.save
			redirect_to user_path(current_user)
		else
			redirect_to user_path
		end
	end

	def destroy
	end

	private 

	def post_params
		params.require(:post).permit(:body)
	end


end
