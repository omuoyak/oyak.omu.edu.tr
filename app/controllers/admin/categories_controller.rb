class Admin::CategoriesController < AdminController
  before_action :set_category, only: [:show, :edit, :destroy, :update]

  def new
    @category = Category.new
    authorize @category
  end

  def index
    @categories = Category.all.order(id: :desc)
  end
  
  def edit
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      redirect_to admin_categories_path(@category), notice: 'Kategori Eklendi'
    else
      render :new
    end
  end

  def update
    authorize @category
    if @category.update category_params
      redirect_to admin_category_path(@category), notice: 'Kategori Güncellendi'
    else
      render :edit
    end
  end

  def destroy
    authorize @category
    @category.destroy!
    redirect_to admin_categories_path, alert: "Kategori Silindi.
    Girdiler arasında bu kategoriye sahip olan varsa girdiyi düzenleyerek 
    başka bir kategoriye atayınız.
    Aksi taktirde girdi ziyaretçiler tarafından görüntülenemeyecektir."
  end


  private

  def category_params
    params.require(:category).permit(:title, :description, :keywords, :sef_links)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
