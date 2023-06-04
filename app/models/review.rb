class Review < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :content, presence: :true
  validates :content, length: { maximum: 600 }
end
