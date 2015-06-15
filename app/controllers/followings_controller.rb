class FollowingsController < ApplicationController

  def create
    @following = Following.new(following_params)
    if @following.save
      flash[:notice] = "Now following"
      redirect_to user_path
    else
      render action:'new'
    end
  end

  def destroy
    @following = Following.find(params[:id])
    @following.destroy
    flash[:notice] = "Un-followed"
    redirect_to user_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def following_params
      params.require(:following).permit(:user_id, :follower_id)
    end
end
