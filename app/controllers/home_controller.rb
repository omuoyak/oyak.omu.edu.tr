class HomeController < ApplicationController

  def index; end

  def blog
    @Posts = Post.order(id: :desc).last(20)
  end

  def docs
    # TODO: Dökümantasyonu getir
    # pry
  end

  def post
    url = params[:sef].split('--')
    if url.last
      @Post = Post.find(url.last)
      if @Post && url.first == @Post.sef_link
      else
        redirect_to show_post_path(sef: @Post.url)
      end
    else
      redirect_to root_path
    end
  end

end
