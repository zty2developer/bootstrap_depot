class ModifyProductColumnName < ActiveRecord::Migration[5.0]
  def change
		change_column :products, :image_url, :image
  end

	def up
		change_column :products, :image_url, :image
	end

	def down
		change_column :products, :image, :image_url
	end
end
