class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@videos = @user.videos
	end	

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
			if @user.save
				session[:user_id] = @user.id
				redirect_to '/'
			else
				redirect_to '/signup'
			end		
	end

	private
	def user_params
		params.require(:user).permit(:user_name,:email,:password,:image)
	end

end
