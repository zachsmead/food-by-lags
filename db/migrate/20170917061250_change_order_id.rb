class ChangeOrderId < ActiveRecord::Migration[5.0]
  def change
  	change_column :carts, :order_id, :integer
  end
end
