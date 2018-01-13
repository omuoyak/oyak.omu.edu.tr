class Admin::ActivitiesController < AdminController
  before_action :set_activity, only: [:show, :edit, :destroy, :update]

  def new
    @activity = Activity.new
    authorize @activity
  end

  def index
    @activities = Activity.all.order(id: :desc)
  end

  def show; end

  def edit
    authorize @activity
  end

  def create
    tbs_id = activity_params[:tbs_id].to_i
    if tbs_id > 0
      @activity = get_activity(tbs_id)
    else
      @activity = Activity.new(activity_params)
    end
    authorize @activity
    if @activity.save
      redirect_to admin_activity_path(@activity), notice: 'Eklendi'
    else
      render :new
    end
  end

  def update
    authorize @activity
    if @activity.update activity_params
      redirect_to admin_activity_path(@activity), notice: 'Güncellendi'
    else
      render :edit
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :speaker, :date, :detail, :location, :poster, :tbs_id, images: [])
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def get_activity(tbs_id)
    page = Nokogiri::HTML(open("http://topluluk.omu.edu.tr/events/#{tbs_id}"))
    table = page.css("#print-place > table > tr")
    activity = Activity.new
    activity.name = table[1].css("td").last.text
    activity.speaker = table[2].css("td").last.text
    activity.date = "#{table[3].css('td')[1].text.to_date} #{table[3].css('td').last.text.gsub(' ','')}"
    activity.detail = table[4].css("td").last.text
    activity.location = table[6].css("td").last.text
    activity.remote_poster_url = "http://topluluk.omu.edu.tr#{page.css(".panel-body > a").first['href']}"
    activity.tbs_id = tbs_id
    activity
  end
end
