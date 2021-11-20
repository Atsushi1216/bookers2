class Book < ApplicationRecord
  belongs_to :user
  attachment :image

  validates :Title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 }
end
