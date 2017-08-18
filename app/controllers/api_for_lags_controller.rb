class ApiForLagsController < ApplicationController

	def index
		@cart = Cart.where(status: 'carted')

	end

	def products_index
		@products = Product.all
	end

	def new
	end

	def delete_cart_item
		@bag = params
		newCart = @bag['newCart']
		final_cart = JSON.parse(newCart)


		puts "*" * 100
		puts "*" * 100
		puts "*" * 100

		puts "final_cart inspect below"
		puts final_cart.inspect
		puts "final_cart['id'] inspect below"
		puts final_cart['id']
		id = final_cart['id']
		puts "id below"
		puts id

		puts "*" * 100
		puts "*" * 100
		puts "*" * 100




		@item_to_delete = Cart.last
		@item_to_delete.delete
	end


	def create
		@bag = params
		new_cart = @bag['newCart']
		final_cart = JSON.parse(new_cart)
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100


		puts "final_cart inspect below"
		puts final_cart.inspect
		puts "final_cart.id"
		puts final_cart[0]['id']

		puts "*" * 100
		puts "*" * 100
		puts "*" * 100

		@cart_item = Cart.create(
			product_id: final_cart[0]['id'],
			quantity: 1,
			status: 'carted'
		)
		render 'create.json.jbuilder'
	end

	def show
		@order = Order.find_by(id: params[:id])
	end

	def checkout 
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100

		@bag = params
		newBag = @bag['newOrder']

		puts "@bag below"
		puts @bag
		puts "newBag below"
		puts newBag




		puts "*" * 100
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100

		# @new_order = Order.create()
		render 'checkout.json.jbuilder'
	end


end