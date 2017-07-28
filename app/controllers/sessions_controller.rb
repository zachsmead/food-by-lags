class SessionsController < ApplicationController


	def signin
		user = User.find_by(email: params[:email])
		if user
			session[:id] = user.id
			puts "*" * 100
			puts "*" * 100
			puts "*" * 100
			puts session[:id]
			puts "*" * 100
			puts "*" * 100
			puts "*" * 100
			flash[:success] = "You Have Successfully Logged In"
			redirect_to "/"
		else
			flash[:danger] = "Invalid Email or Password"
			redirect_to "/"
		end
	end

	def signout
		if session[:id]
			session[:id] = nil
			flash[:success] = "You have succussfully signed out"
			redirect_to "/"
		end

	end
end
