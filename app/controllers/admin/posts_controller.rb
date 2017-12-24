class Admin::PostsController < AdminController
  before_action :set_post, only: [:show, :edit, :destroy, :update]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.includes(:categories).all.order(id: :desc)
  end

  def show; end
  def edit; end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to admin_post_path(@post), notice: 'Eklendi'
    else
      render :new
    end
  end

  def update
    if @post.update post_params
      redirect_to admin_post_path(@post), notice: 'Güncellendi'
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :cover, :body, :keywords, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
