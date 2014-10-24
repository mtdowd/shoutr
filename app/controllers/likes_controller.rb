class LikesController < ApplicationController

  def create
    @shout = current_shout
    current_user.liked_shouts << @shout

    redirect_to :back
  end

  def destroy
    @shout = current_shout
    current_user.liked_shouts.delete(@shout)

    redirect_to :back
  end

  private

  def current_shout
    Shout.find(params[:shout_id])
  end
end
