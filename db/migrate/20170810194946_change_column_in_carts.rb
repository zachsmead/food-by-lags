class ChangeColumnInCarts < ActiveRecord::Migration[5.0]
  def change
  	change_column :carts, :quantity, :integer, precision: 9, scale: 2
  end
end
