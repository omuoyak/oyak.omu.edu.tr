class HomeController < ApplicationController

  def index
    @latest_posts = latest_posts
    @latest_activities = latest_activities
  end

  def docs
    # TODO: Dökümantasyonu getir
    # pry
  end

  private

  def latest_posts
    Rails.cache.fetch('latest_posts'){ Post.where(approved: true).last(5).reverse }
  end

  def latest_activities
    Rails.cache.fetch('latest_activities'){ Activity.last(5).reverse }
  end

end
