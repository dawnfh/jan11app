class UsersController < ApplicationController
  def index
  	@user = User.all
  end

  def show
  	@current_user = User.post.where(user_id: session[:user_id])
  	@post = @user.posts

  	# @user = User.find(params [:id])
  end

  def new
  	@user = User.new
  end

  def create
		puts params.inspect
		@user=User.where(username: params)
		if @user && @user.password ==params[:password]
			session[:user_id] = @user.id
			redirect_to user_path
		else
      flash[:alert] = "Please enter a username  & password"
			redirect_to :back
		end
  end 

  def edit
  	 puts params.inspect
  		@user = User.find(params[:id])


  def update
		@user = User.find(params [:id])
		@user.update(params[:user])
		@user.save
		redirect_to @user
	end

	def destroy
		@user = User.find(params[:id])
		if
end

