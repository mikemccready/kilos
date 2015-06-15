class FollowingsController < ApplicationController

  def create
    @following = current_user.followings.build(:follower_id => params[:follower_id])
    if @following.save
      flash[:notice] = "Now following"
      redirect_to users_path
    else
      flash[:notice] = "Unable to follow"
      redirect_to users_path
    end
  end

  def destroy
    @following = current_user.followings.find(params[:id])
    @following.destroy
    flash[:notice] = "Un-followed"
    redirect_to users_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def following_params
      params.require(:following).permit(:user_id, :follower_id)
    end
end
