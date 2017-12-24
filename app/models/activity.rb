class Activity < ApplicationRecord
  mount_uploader :poster, PosterUploader

  has_many :images
  before_create :sef

  after_commit on: [:create, :update, :destroy] do
    clear_caches
  end


  def url
    "#{sef_link}--#{id}.html"
  end

  def sef
    self.sef_link = name.parameterize unless sef_link?
  end
  private
  def clear_caches
    Rails.cache.delete('latest_activities')
  end

end
