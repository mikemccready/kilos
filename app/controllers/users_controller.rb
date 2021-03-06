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
				redirect_to videos_path
			else
				redirect_to new_user_path
			end		
	end

	def edit
		@user = User.find(params[:id])
	end

	def update 
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to users_path
		else
			render :edit
		end

	end

	def destroy 
		@user = User.find(params[:id]) 
		@user.destroy 
		redirect_to users_path 

	end


	private
	def user_params
		params.require(:user).permit(:user_name,:email,:password,:password_confirmation,:image)
	end

end
