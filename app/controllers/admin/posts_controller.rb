class Admin::PostsController < AdminController
  before_action :set_post, only: [:show, :edit, :destroy, :update]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all.order(id: :desc)
  end

  def show; end
  def edit; end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Eklendi'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :keywords, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
