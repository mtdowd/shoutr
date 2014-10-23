class SearchesController < ApplicationController

  def show
    @shout_results = Shout.text_shout_query(text_shout_search_ids)
    @user_results = User.user_query(params[:query])
  end

  private

  def text_shout_search_ids
    TextShout.text_shout_search(params[:query]).pluck(:id)
  end
end
