class Post < ApplicationRecord
  mount_uploader :cover, CoverUploader

  has_and_belongs_to_many :categories
  belongs_to :user
  before_create :do_before

  after_commit on: [:create] do
    clear_caches
  end

  after_commit on: [:update] do
    clear_caches
  end

  after_commit on: [:destroy] do
    clear_caches
  end

  def url
    "#{sef_link}--#{id}.html"
  end

  def do_before
    self.sef_link = title.parameterize unless sef_link?
    self.approved = true if user.role == 'admin'
  end

  private
  def clear_caches
    Rails.cache.delete('latest_posts')
  end
end
