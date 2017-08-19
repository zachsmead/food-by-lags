class ApiForLagsController < ApplicationController

	def index
		@cart = Cart.where(status: 'carted')

	end

	def products_index
		@products = Product.all
	end

	def new
	end






	def create_order
		@bag = params
		subtotal = 0

		@carts = Cart.where(status: "carted")
			
		@carts.each do |item|
			subtotal += item.quantity * item.product.cost
		end

		puts "*" * 100
		puts "*" * 100

		puts "subtotal below"
		puts subtotal


		puts "*" * 100
		puts "*" * 100
		tax = subtotal * 0.09
		total = subtotal + tax




		@new_order = Order.create(
			first_name: @bag['first_name'],
			last_name: @bag['last_name'],
			email: @bag['email'],
			address: @bag['address'],
			tax: tax,
			subtotal: subtotal,
			total: total
			)
		if @new_order.save
			@cart_item.each do |item|
				item.status = "Purchased"
				--item.product.stock
				item.save
			end
		else
			@cart_item.each do |item|
				item.delete
			end
		end


		render 'create_order.json.jbuilder'

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

	def create_comment
		@bag = params
		newBag = @bag['newComment']
		name = @bag['name']
		id = @bag['comment_id']
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100

		puts "newBag inspect below"
		puts newBag.inspect
		puts @bag['comment_id']

		puts "*" * 100
		puts "*" * 100
		puts "*" * 100




		puts "&" * 100
		@text = Text.create(
			name: name,
			text: newBag,
			comment_id: id,
			approved: false
		)
		puts "&" * 100







		puts "&" * 100
		# OrderMailer
		if @text.save
			OrderMailer.text_approval(@text).deliver
		flash[:success] = "Your comment or question has been successfully sent."
		redirect_to "/contacts"

		else
			flash[:danger] = "Something went wrong with the mailing process."
			redirect_to "/contacts"

		end
		puts "&" * 100


	end


end