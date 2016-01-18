class PostsController < ApplicationController
	def index
		# @post = current_user.posts.build
		@posts = Post.all
	end


	def show
		@post = Post.find(params[:id])
		@comments = @post.comments
		if current_user
			@comment = current_user.comments.build
		end
	end

	def new
		@post = Post.new
	end


	def create
		@post = current_user.posts.build(post_params) 
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
