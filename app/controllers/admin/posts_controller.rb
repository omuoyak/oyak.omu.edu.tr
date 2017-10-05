class Admin::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :destroy, :update]

  def new
    @Post = Post.new
  end

  def show
  end

  def create
    @Post = Post.new(post_params)
    if @Post.save
      redirect_to @Post, notice: 'Eklendi'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :keywords, category_ids: [])
  end

  def set_post
    @Post = Post.find(params[:id])
  end

end
