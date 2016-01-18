class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:alert] = "Please enter a username  & password"
      redirect_to :back
    end
  end 

  def show
    @user = User.find(params[:id])
    @user
  end

  def edit
  	puts params.inspect
  	@user = User.find(params[:id])
    @user.save
  end

  def update
		@user = User.find(params[:id])
	 if @user.update_attributes(user_params)
    @user.save
		  redirect_to user_path(@user)
   else
      render edit_user_path(@user)
    end
  end
  

	def destroy
		@user = User.find(params[:id]) 
		if @user.delete
      redirect_to user_path, notice: "Deleted Account"
    else
      render_error_message
  end
end


  private 

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

