class TextShoutsController < ApplicationController
  before_action :require_login

  def create
    @text_shout = TextShout.new(text_shout_params)
    @photo_shout = PhotoShout.new
    @shouts = current_user.timeline.page(params[:page])

    if @text_shout.save
      current_user.shouts.create(content: @text_shout)
      flash[:notice] = "Shout created!"
      redirect_to dashboard_path
    else
      render "dashboards/show"
    end
  end

  private

  def text_shout_params
    params.require(:text_shout).permit(:body)
  end
end
