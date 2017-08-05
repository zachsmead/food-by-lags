class ProductsController < ApplicationController
	def index
		@products = Product.all
		if current_user
			@cart = current_user.carts.where(status: "carted")
		end
		@total = 0
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
		item = Product.new(name: name, product_type: product_type, stock: stock, cost: cost)
		item.save
		redirect_to "/products"
	end

	def update
	end

	def destroy
	end

end
