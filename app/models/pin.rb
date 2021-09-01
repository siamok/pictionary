class Pin < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :ratings

  validates :image, file_size: { less_than_or_equal_to: 3.megabytes },
    file_content_type: { allow: ['image/jpeg', 'image/png', 'image/jpg'] }
end
