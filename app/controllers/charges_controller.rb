class ChargesController < ApplicationController
# 	if there are any problems with allowing access with header etc, uncomment below
	protect_from_forgery with: :null_session

	def new
		@order = Order.find_by(id: params[:id])
		@amount_in_cents = @order.total * 100
	end

	def create
		#amount in cents
		@order = Order.find_by(id: params[:id].to_i)
		@amount = @order.total * 100

		customer = Stripe::Customer.create(
			:email => params[:stripeEmail],
			:source	=> params[:stripeToken]
		)

		puts "*" * 100
		puts params.inspect
		puts "*" * 100

		charge = Stripe::Charge.create(
			:customer => customer.id,
			:amount => @amount.to_i,
			:description => 'Rails Stripe Customer',
			:currency => 'usd'
		)

		email = @order.email
		if charge.save
			OrderMailer.order_confirmation(email).deliver
			flash[:success] = "Thank You For Your Order!"
			redirect_to "/users" , notice: "Order Completed! We Sent You a Confirmation Email"
		else
			flash[:danger] = "Something went wrong"
			redirect_to "/orders"
		end

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end
end
