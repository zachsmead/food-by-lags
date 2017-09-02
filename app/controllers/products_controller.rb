class ProductsController < ApplicationController
	def index
		@products = Product.all
		@cart = Cart.where(status: "carted")
		@total = 0
		@cart.each do |item|
			@total += item.product.cost
		end
	end

	def show
	end

	def new
	end

	def create
		name = params[:name]
		product_type = params[:product_type]
		stock = params[:stock]
		cost = params[:cost]
		image = params[:image]
		item = Product.new(name: name, product_type: product_type, stock: stock, cost: cost, image: image)
		item.save
		redirect_to "/products"
	end

	def update
	end

	def destroy
	end

end
