class HomeController < ApplicationController

  def index
    @latest_posts = latest_posts
    @latest_activities = latest_activities
    @latest_suggestions = latest_suggestions
  end

  def docs
    # TODO: Dökümantasyonu getir
    # pry
  end

  private


  def latest_suggestions
    Rails.cache.fetch('latest_suggestions'){ Suggestion.last(5).reverse }
  end

  def latest_posts
    Rails.cache.fetch('latest_posts'){ Post.where(approved: true).last(5).reverse }
  end

  def latest_activities
    Rails.cache.fetch('latest_activities'){ Activity.last(10).reverse }
  end

end
