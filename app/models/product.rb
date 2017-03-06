class Product < ApplicationRecord
	has_many :line_items, dependent: :destroy

	validates :title, :description, presence: true
	validates :title, uniqueness: true
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	mount_uploader :image_url, ImageUrlUploader 
	
<<<<<<< HEAD
=======
	has_many :line_items
>>>>>>> 73193e1dffa2199d103b3e585e8aaf29caa577f0
	before_destroy :ensure_not_referenced_by_any_line_item

	private
	def ensure_not_referenced_by_any_line_item
<<<<<<< HEAD
		if line_items.empty?
			return true
		else
			errors.add(:base, "Line Items present")
			return false
		end
=======
		 if line_items.empty?
			 return true
		 else
			 errors.add(:base, 'Line Items Present')
			 return false
		 end
>>>>>>> 73193e1dffa2199d103b3e585e8aaf29caa577f0
	end
end
