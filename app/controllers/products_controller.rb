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
		description = params[:description]
		item = Product.new(name: name, product_type: product_type, stock: stock, cost: cost, image: image, description: description)
		item.save
		if item.save
			flash[:info] = "You Succesfully Added a Product"
		else
			flash[:info] = "Something Went Wrong"
		end
		redirect_to "/products"
	end

	def update
		product = Product.find_by(id: params[:id])
		product.name = params[:name]
		product.product_type = params[:product_type]
		stock = params[:stock]
		parsed_stock = stock.to_i
		product.stock = parsed_stock
		cost = params[:cost]
		parsed_cost = cost.to_i
		product.cost = parsed_cost
		product.image = params[:image]
		product.id = params[:id]
		product.description = params[:description]



		product.save
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100

		puts product.errors.full_messages
		puts product.description
		puts params[:description]

		puts "*" * 100
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100

		if product.save
			flash[:info] = "You succesfully updated your product"
		end
		redirect_to "/products"

	end

	def destroy
		product = Product.find_by(id: params[:id])
		product.delete
		flash[:info] = "You Succefully Deleted Your Product"
		redirect_to "/products"

	end

end
