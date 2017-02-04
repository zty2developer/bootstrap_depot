class Product < ApplicationRecord
	validates :title, :description, presence: true
	validates :title, uniqueness: true
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	mount_uploader :image_url, ImageUrlUploader 
	
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	private
	def ensure_not_referenced_by_any_line_item
		 if line_items.empty?
			 return true
		 else
			 errors.add(:base, 'Line Items Present')
			 return false
		 end
	end
end
