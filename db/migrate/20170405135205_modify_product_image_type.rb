class ModifyProductImageType < ActiveRecord::Migration[5.0]
  def change
		change_column :products, :image, :JSON
  end
end
