class ChangeColumnInCartsTwo < ActiveRecord::Migration[5.0]
  def change
  	change_column :carts, :product_id, :integer
  end
end
