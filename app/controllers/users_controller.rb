class UsersController < ApplicationController

	def index
	end

	def show
		redirect_to "/users"
	end

	def new
	end

	def create
		ship_one = params[:address_one]
		ship_two = params[:address_two]
		if ship_one && ship_two
			shippingaddress = ship_one + " " + ship_two
		elsif 
			shippingaddress = ship_one 
		end
		@user = User.new(first_name: params[:first_name],
						 last_name: params[:last_name],
						 email: params[:email],
						 address: shippingaddress,
						 password: params[:password],
						 password_confirmation: params[:password_confirmation],
						 admin: params[:admin])
		@user.save
		if @user.save
			session[:id] = @user_id
			flash[:success] = "Hello #{@user.first_name}! You Have Successfully Signed Up, Please Log in Below"
		else 
			flash[:danger] = "Invalid Match"
		end
		redirect_to "/users"
	end

	def edit
	end

	def update
		@user = User.find_by(id: current_user.id)
		@user.first_name = params[:first_name]
		@user.last_name = params[:last_name]
		ship_one = params[:address_one]
		ship_two = params[:address_two]
		if ship_one && ship_two
			shippingaddress = ship_one + " " + ship_two
		else
			shippingaddress = ship_one 
		end
		@user.address = shippingaddress
		@user.save
		if @user.save
			puts "*" * 100
			puts "*" * 100
			puts "*" * 100
			@user.inspect
			puts "*" * 100
			puts "*" * 100
			puts "*" * 100
		flash[:success] = "You Have Succesfully Updated Your Account"
		else
		flash[:danger] = "Something Went Wrong With Update input"
		end
		redirect_to "/users"
	end

	def comingsoon
		
	end

end