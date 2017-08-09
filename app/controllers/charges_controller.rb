class ChargesController < ApplicationController
	def new
	end

	def create
		#amount in cents
		@order = Order.last
		@amount = @order.total * 100

		customer = Stripe::Customer.create(
			:email => params[:stripeEmail],
			:source	=> params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			:customer => customer.id,
			:amount => @amount.to_i,
			:description => 'Rails Stripe Customer',
			:currency => 'usd'
		)

		@buyer = User.find_by(id: current_user.id)

		if charge.save
			OrderMailer.order_confirmation(@buyer).deliver
			redirect_to @buyer, notice: "Order Completed! We Sent You a Confirmation Email"
		else
			flash[:danger] = "Something went wrong"
			redirect_to "/orders"
		end

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end
end
