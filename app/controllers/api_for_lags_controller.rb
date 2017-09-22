class ApiForLagsController < ApplicationController

	def index
		@cart = Cart.where(status: 'carted')

	end

	def products_index
		@products = Product.all

	end

	def carted_items
		@carts = Cart.where(status: "carted")
	end

	def new
	end

	def add_text_to_comment
		name = params[:name]
		text = params[:text]
		commentId = params[:comment_id]

		@new_text = Text.create(name: name,
								text: text,
								comment_id: commentId,
								approved: false)
		if @new_text.save
			OrderMailer.text_approval(@new_text).deliver
			redirect_to "/contacts" 
			flash[:success] = "Your text has been successfully sent."

		else
			flash[:danger] = "Something went wrong with the mailing process."
			redirect_to "/contacts"

		end
	end




	def create_order
		@bag = params
		subtotal = 0
		@carts = Cart.where(status: "carted")
			
		@carts.each do |item|
			subtotal += item.quantity * item.product.cost
		end
		tax_value = 0.09
		tax = subtotal * 0.09
		total = subtotal + tax


		@new_order = Order.create(
			first_name: @bag['firstName'],
			last_name: @bag['lastName'],
			email: @bag['email'],
			address: @bag['address'],
			tax: tax,
			subtotal: subtotal,
			total: total
			)
		if @new_order.save
			@carts.each do |item|
				item.status = "Purchased"
				item.order_id = @new_order.id
				--item.product.stock
				item.save
			end
		else !@new_order.save
			puts "*" * 100
			puts "*" * 100
			puts "*" * 100
			puts "*" * 100

			puts @new_order.errors.full_messages

			puts "*" * 100
			puts "*" * 100
			puts "*" * 100
			puts "*" * 100

		end




		render 'create_order.json.jbuilder'

	end








	def delete_cart_item
		@bag = params
		tobenewCart = @bag['newCart']
		newCart = JSON.parse(tobenewCart)

		puts '*' * 100
		puts newCart
		puts '*' * 100

		puts "params['newCart']['id'] below"

		if newCart['id']
			newCartId = newCart['id']
		elsif newCart['newCart']['id']
			newCartId = newCart['newCart']['id']
		end
		
		puts newCartId







		puts ">" * 100
		puts "*" * 100
		puts newCart['id']
		puts "U" * 100
		puts "*" * 100




		@item_to_delete = Cart.find_by(id: newCartId)




		@item_to_delete.delete
		flash[:info] = "You Deleted the item from your cart"
		# redirect_to "/products"
	end


	def create
		@bag = params
		# puts "@__@" * 100
		puts @bag.inspect
		puts "&" * 100

		# new_cart = @bag['newCart']
		# final_cart = JSON.parse(new_cart)
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100
		final_cart = @bag['newCart']
		puts "final cart beloooow"
		puts final_cart.inspect
		puts "final_cart.id"
		puts final_cart['id']
		# the variable final_cart['product_id'] does not exist
		# puts final_cart['product_id'].errors.full_messages

		puts "*" * 100
		puts "*" * 100
		puts "*" * 100
		@cart_item = Cart.create(
			product_id: final_cart['id'],
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
		id = JSON.parse(@bag['comment_id'])
		puts "*" * 100
		puts "*" * 100
		puts "*" * 100

		puts "newBag inspect below"
		puts newBag.inspect
		puts @bag['comment_id']

		puts "*" * 100
		puts "*" * 100
		puts "*" * 100




		@text = Text.create(
			name: name,
			text: newBag,
			comment_id: id,
			approved: false
		)







		puts "&" * 100

		puts "&" * 100

		puts "&" * 100

		puts "&" * 100

		puts "&" * 100

		# OrderMailer
		if @text.save
			OrderMailer.text_approval(@text).deliver
			redirect_to "/contacts" 
			flash[:success] = "Your text has been successfully sent."

		else
			flash[:danger] = "Something went wrong with the mailing process."
			redirect_to "/contacts"

		end

	end


end