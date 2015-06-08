class VideosController < ApplicationController

	before_action :require_user, only: [:create, :update, :destroy]

	def index
		@videos = Video.all
		
	end

	def show
		@video = Video.find(params[:id])
	end

	def new
		@video = Video.new
	end

	def create
		@video = Video.new(video_params)
		@video.user_id = current_user.id

			if @video.save
				redirect_to videos_path
			else	
				render :new
			end
	end

	def edit
		@video = Video.find(params[:id])
	end

	def update 
		@video = Video.find(params[:id])
		if @video.update_attributes(video_params)
			redirect_to videos_path
		else
			render :edit
		end

	end

	def destroy 
		@video = Video.find(params[:id]) 
		@video.destroy 
		redirect_to videos_path 

	end

	private	

		def video_params
			params.require(:video).permit(:source,:title,:description,:user_id)
		end


end
