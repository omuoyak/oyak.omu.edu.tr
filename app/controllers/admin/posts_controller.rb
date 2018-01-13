class Admin::PostsController < AdminController
  before_action :set_post, only: [:show, :edit, :destroy, :update]
  def new
    @post = Post.new
    authorize @post
  end

  def index
    @posts = Post.includes(:categories).all.order(id: :desc)
  end

  def show; end

  def edit
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to admin_post_path(@post), notice: 'Eklendi'
    else
      render :new
    end
  end

  def update
    authorize @post
    if @post.update post_params
      redirect_to admin_post_path(@post), notice: 'Güncellendi'
    else
      render :edit
    end
  end

  def destroy
    authorize @post
    @post.destroy!
    redirect_to admin_posts_path, alert: 'Silindi'
  end

  def ch_state
    @post = Post.find(params[:post_id])
    @post.update(approved: !@post.approved)
    redirect_to admin_posts_path, notice: 'Güncellendi'
  end

  private

  def post_params
    params.require(:post).permit(:title, :cover, :body, :keywords, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
