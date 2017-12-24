class Post < ApplicationRecord
  mount_uploader :cover, CoverUploader

  has_and_belongs_to_many :categories
  belongs_to :user
  before_create :sef

  def url
    "#{sef_link}--#{id}.html"
  end

  def sef
    self.sef_link = title.parameterize unless sef_link?
  end
end
