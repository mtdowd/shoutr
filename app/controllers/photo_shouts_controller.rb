class PhotoShoutsController < ApplicationController
  before_action :require_login

  def create
    @photo_shout = PhotoShout.new(photo_shout_params)
    @text_shout = TextShout.new
    @shouts = current_user.timeline.page(params[:page])

    if @photo_shout.save
      current_user.shouts.create(content: @photo_shout)
      flash[:notice] = "Shout created"
      redirect_to dashboard_path
    else
      render "dashboards/show"
    end
  end

  private

  def photo_shout_params
    params.require(:photo_shout).permit(:url)
  end
end
