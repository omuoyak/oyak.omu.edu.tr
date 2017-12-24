class HomeController < ApplicationController

  def index
    @latest_posts = Post.last(5).reverse
  end
  
  def docs
    # TODO: Dökümantasyonu getir
    # pry
  end

end
