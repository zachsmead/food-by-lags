class CartsController < ApplicationController
	def index 
		@cart = Cart.where(status: "carted")
		if @cart.length == 0
			flash[:danger] = "Cart is Empty"
		end
		redirect_to "/products"

	end

	def new 
	end

	def create
		product_id = params[:product_id]
		products = Product.where(id: product_id)

		if products.length > 0

			quantity = params[:quantity]
			@add_to_cart = Cart.new(product_id: product_id,
									quantity: quantity,
									status: "carted")
		else
			flash[:info] = "Sorry, we are out of this product."
		end
		@add_to_cart.save
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100
		if @add_to_cart.save
			puts "*" * 100
			puts "*" * 100
			puts "*" * 100
			puts "Saved"
		end
		@subtractproduct = Product.where(id: product_id)
		@subtractproduct.each do |item|
			item.stock = item.stock - quantity.to_i
			item.save
		end


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
