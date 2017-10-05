class Post < ApplicationRecord
  has_and_belongs_to_many :categories
  before_create :sef

  def url
    "#{sef_link}--#{id}.html"
  end

  def sef
    self.sef_link = title.parameterize unless sef_link?
  end
end
