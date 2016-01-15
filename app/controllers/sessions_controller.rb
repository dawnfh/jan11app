class SessionsController < ApplicationController
	def new
		
	end

	def create
		@user=User.where(username: params[:username]).first
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
			redirect_to posts_path
# 		else
# 			flash[:alert] = "Are we in yet"
# 			redirect_to log_in_path
		end
	end

# 		def destroy
#      session[:user_id] = nil
#      redirect_to home_path
# 		end
# 	end
end

