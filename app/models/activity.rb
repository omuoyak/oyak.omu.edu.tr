class Activity < ApplicationRecord
  has_many :images, dependent: :destroy
end
