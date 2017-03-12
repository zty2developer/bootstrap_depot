class AddOrderIdToLineItem < ActiveRecord::Migration[5.0]
  def change
		add_column :line_items, :order_id, :integer, default: nil
  end
end
