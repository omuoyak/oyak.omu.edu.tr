class Suggestion < ApplicationRecord
  mount_uploader :image, SuggestionUploader

  validates :title, presence: true


  def has_link
    link && link.size > 0
  end
end
