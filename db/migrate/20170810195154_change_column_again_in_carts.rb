class ChangeColumnAgainInCarts < ActiveRecord::Migration[5.0]
  def change
  	change_column :carts, :quantity, :integer

  end
end
