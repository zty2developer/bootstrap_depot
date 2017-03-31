class RenameProductImageUrlToImage < ActiveRecord::Migration[5.0]
  def change
		rename_column :products, :image_url, :image
  end
end
