class OrdersController < ApplicationController
	def create
		@new_order = Cart.where(status: "carted")
		subtotal = 0
		@new_order.each do |cart_item|
			subtotal += (cart_item.product.cost * cart_item.quantity)
		end
		tax = subtotal * 0.09
		total = subtotal + tax
		first_name = params[:first_name]
		last_name = params[:last_name]
		email = params[:email]
		address_one = params[:address_one]
		address_two = params[:address_two]
		address = address_one + " " + address_two


		@order = Order.create(first_name: first_name,
						   	  last_name: last_name,
						   	  address: address,
						      email: email,
						      subtotal: subtotal,
						      tax: tax,
						      total: total)

		puts @order.inspect
		if @order.save
			@new_order.each do |item|
				puts "*" * 100
				puts "*" * 100
				puts "*" * 100
				puts item.status
				puts "*" * 100
				puts "*" * 100
				puts "*" * 100

				item.status = "Purchased"
				item.order_id = item.id
				item.save
			end
		end
		redirect_to "/orders/#{@order.id}"

	end

	def show
		@order = Order.find_by(id: params[:id])
		@amount_in_cents = @order.total * 100
	end
end
