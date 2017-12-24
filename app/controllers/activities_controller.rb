class ActivitiesController < ApplicationController
  def show
    url = params[:sef].split('--')
    if url.last
      @activity = Activity.includes(:images).find(url.last)
      unless @activity && url.first == @activity.sef_link
        redirect_to show_activity_path(sef: @activity.url)
      else

      end
    else
      redirect_to root_path
    end
  end

  def index
    @activities = Activity.order(date: :desc).page(params[:page]).per(10)
  end
end
