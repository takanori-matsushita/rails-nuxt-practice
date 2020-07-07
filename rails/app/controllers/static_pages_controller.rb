class StaticPagesController < ApplicationController
  before_action :authorize_request

  def home
      @feed_items = @current_user.feed.page(params[:page]).per(30)
      render json: { user: @current_user, feed_items: @feed_items }, status: :ok
  end
end
