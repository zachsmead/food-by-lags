class OrdersController < ApplicationController
	:authenticate_user!
	def create
		@new_order = Cart.where(user_id: current_user.id,
								status: "carted")
		subtotal = 0
		@new_order.each do |cart_item|
			subtotal += (cart_item.product.cost * cart_item.quantity)
		end
		tax = subtotal * 0.09
		total = subtotal + tax
		@order = Order.new(user_id: current_user.id,
							  subtotal: subtotal,
							  tax: tax,
							  total: total)
		@new_order.each do |item|
			item.status = "Purchased"
			item.order_id = item.id
			item.save
		end
		@order.save
		redirect_to "/orders/#{@order.id}"

	end

	def show
		@order = Order.find_by(id: params[:id])
		@amount_in_cents = @order.total * 100
	end
end
