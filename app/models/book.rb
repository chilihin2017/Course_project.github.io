class Book < ApplicationRecord
  mount_uploader :file, BookUploader
  mount_uploader :image, ImageUploader

  validates :title, :body, :image, :file, presence: true
end
