class PostsController < ApplicationController

  def show
    url = params[:sef].split('--')
    if url.last
      @post = Post.includes(:categories).find(url.last)
      unless @post && url.first == @post.sef_link
        redirect_to show_post_path(sef: @post.url)
      else

      end
    else
      redirect_to root_path
    end
  end

  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(10)
  end

end
