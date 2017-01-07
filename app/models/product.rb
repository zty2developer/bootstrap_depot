class Product < ApplicationRecord
	validates :title, :description, presence: true
	validates :title, uniqueness: true
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	mount_uploader :image_url, ImageUrlUploader 
end
