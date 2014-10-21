class FollowsController < ApplicationController

  def create
    @user = User.find_by(username: params[:id])
    current_user.follow(@user)

    flash[:notice] = "You are now following #{@user.username}"

    redirect_to @user
  end

  def destory
    @user = User.find_by(username: params[:id])
    current_user.unfollow(@user)

    flash[:notice] = "You are no longer following #{@user.username}"

    redirect_to @user
  end
end
