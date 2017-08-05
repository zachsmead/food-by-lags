class CangeCoumnToDecimal < ActiveRecord::Migration[5.0]
  def change
  	change_column :orders, :tax, :decimal, precision: 9, scale: 2
  	change_column :orders, :subtotal, :decimal, precision: 9, scale: 2
  	change_column :products, :stock, :decimal, precision: 9, scale: 2
  	change_column :products, :cost, :decimal, precision: 9, scale: 2
  	change_column :carts, :user_id, :decimal, precision: 9, scale: 2
  	change_column :carts, :product_id, :decimal, precision: 9, scale: 2
   	change_column :carts, :quantity, :decimal, precision: 9, scale: 2
  	change_column :carts, :order_id, :decimal, precision: 9, scale: 2


  end
end
