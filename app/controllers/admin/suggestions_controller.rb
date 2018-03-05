class Admin::SuggestionsController < AdminController
  before_action :set_suggestion, only: [:show, :edit, :destroy, :update]

  def new
    @suggestion = Suggestion.new
    authorize @suggestion
  end

  def index
    @suggestions = Suggestion.all.order(id: :desc)
  end

  def show; end

  def edit
    authorize @suggestion
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    authorize @suggestion
    if @suggestion.save
      redirect_to admin_suggestions_path, notice: 'Eklendi'
    else
      render :new
    end
  end

  def update
    authorize @suggestion
    if @suggestion.update suggestion_params
      redirect_to admin_suggestions_path, notice: 'Güncellendi'
    else
      render :edit
    end
  end

  def destroy
    authorize @suggestion
    @suggestion.destroy!
    redirect_to admin_suggestions_path, alert: 'Silindi'
  end


  private

  def suggestion_params
    params.require(:suggestion).permit(:title, :description, :image, :link)
  end

  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end
end
