class CartsController < ApplicationController
	def index 
		@cart = current_user.carts.where(status: "carted")
		if @cart.empty?
			flash[:danger] = "Cart is Empty"
		end
		redirect_to "/products"

	end

	def new 
	end

	def create
		product_id = params[:product_id]
		quantity = params[:quantity]
		@add_to_cart = Cart.new(user_id: current_user.id,
								product_id: product_id,
								quantity: quantity,
								status: "carted")
		@add_to_cart.save
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100
		if @add_to_cart.save
			puts "*" * 100
			puts "*" * 100
			puts "*" * 100
			puts "Saved"

			puts "*" * 100
			puts "*" * 100
			puts "*" * 100

		puts "*" * 100
		puts "*" * 100
		puts "*" * 100
		end
		@subtractproduct = Product.where(id: product_id)
		@subtractproduct.each do |item|
			item.stock = item.stock - quantity.to_i
			item.save
		end
		redirect_to "/products"

	end

	def update
		@cart = Cart.find_by(id: params[:id])
		product_id = params[:product_id]
		product = Product.find_by(id: product_id)
		@cart.status = "Removed"
		@cart.save
		# product.stock_subtract
		flash[:info] = "#{@cart.product.name} has been removed from your cart"
		redirect_to "/carts"



	end



end
