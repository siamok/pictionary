class Rating < ApplicationRecord
  belongs_to :pin

  validates :user_id, presence: true
  validates :rating, presence: true, :inclusion => 1..10
end
