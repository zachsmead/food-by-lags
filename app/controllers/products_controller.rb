class ProductsController < ApplicationController
	def index
		@products = Product.all
		@cart = Cart.where(status: "carted")
		@total = 0
		if @cart.length > 0
			@cart.each do |item|
				@total += item.product.cost
			end
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
		product = Product.find_by(id: params[:id])
		product.name = params[:name]
		product.product_type = params[:product_type]
		product.stock = params[:stock]
		product.cost = params[:cost]
		product.image = params[:image]


		product.save
		flash[:info] = "You succesfully updated your product"
		redirect_to "/products"

	end

	def destroy
		product = Product.find_by(id: params[:id])
		product.delete
		flash[:info] = "You Succefully Deleted Your Product"
		redirect_to "/products"

	end

end
