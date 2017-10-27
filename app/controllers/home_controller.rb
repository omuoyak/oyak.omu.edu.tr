class HomeController < ApplicationController

  def index
    @latest_posts = Post.last(5)
  end

  def blog
    # Son 20 Blog Yazısını Çek
    @posts = Post.order(id: :desc).last(20)
  end

  def docs
    # TODO: Dökümantasyonu getir
    # pry
  end

  def post
    url = params[:sef].split('--')
    if url.last
      @post = Post.find(url.last)
      if @post && url.first == @post.sef_link
      else
        redirect_to admin_post_path(sef: @post.url)
      end
    else
      redirect_to root_path
    end
  end

end
