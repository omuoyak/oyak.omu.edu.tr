class Suggestion < ApplicationRecord
  mount_uploader :image, SuggestionUploader

  validates :title, presence: true

  after_commit on: [:create] do
    clear_caches
  end

  after_commit on: [:update] do
    clear_caches
  end

  after_commit on: [:destroy] do
    clear_caches
  end

  
  def has_link
    link && link.size > 0
  end

  private
  def clear_caches
    Rails.cache.delete('latest_suggestions')
  end
end
